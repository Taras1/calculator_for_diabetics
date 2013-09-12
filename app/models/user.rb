class User < ActiveRecord::Base
  require "digest"
  
# Настройка электронной почты
  require "mail"

  options_mail = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'your.host.name',
    :user_name            => 'sitefordiabetics',
    :password             => 'calculatordiabetics',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
  
  Mail.defaults do
    delivery_method :smtp, options_mail
  end
#Завершение настроек электронной почты  

  VALID_EMAILS_REGEX= /\A([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}\z/
  
  validates :full_name,     presence:   {message: "Фамилия имя и отчество должны быть заполнены"}
  validates :birthday,      presence:   {message: "Укажите дату рождения"}
  validates :phone_number,  presence:   {message: "Нужно указать номер"}
  validates :city,          presence:   {message: "Укажите город проживания"}
  validates :address,       presence:   {message: "Укажите адрес"}
  validates :email,         format:     {with: VALID_EMAILS_REGEX, message: "Вы ввели некорректный E-mail"},
                            uniqueness: {message: "Такой E-mail уже зарегистрирована на сайте."}
  validates :password,      length:     {minimum: 6, message: "Пароль должен содержать минимум 6 символов"}
         
  before_save :hash_of_password, :gen_code_confirm, :gen_session_key
  
  protected
  
  def gen_code_confirm
    unless self.code_confirm
      self.code_confirm = Digest::SHA1.hexdigest(rand(999999999999999999).to_s)
      send_email
    end
  end
  
  def hash_of_password
    self.password = Digest::SHA1.hexdigest(self.password) unless self.password.size == 40
  end
  
  def gen_session_key
    self.session_key = Digest::SHA1.hexdigest( rand(999999999999999999).to_s ) unless self.session_key
  end
  
  def send_email
    text_confirm = "Спасибо за регистрацию на нашем сайте! Для подтверждения email скопируйте код и подтвердите его на сайте\n код --> #{self.code_confirm}"
    email = self.email
    Thread.new do
      Mail.deliver do 
        to      "#{email}"
        from    'sitefordiabetics@gmail.com'
        subject 'Сайт для диабетиков'
        body    text_confirm
      end
    end
  end
  
  
end