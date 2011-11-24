class Zombie < ActiveRecord::Base
  has_many :recipes
  before_save :encriptar_pass

  validates_presence_of :password
  validates_confirmation_of :password
  validates_presence_of :mail
  validates_uniqueness_of :mail


  def self.authenticate(email,password)
    # self.findByEmail(email)
    logger.debug "Estem al auth"
    zombie = Zombie.find_by_mail(email)
    salt = "$2a$10$c4NMmE26y3iH7Z7QPe3g3."
    if zombie && zombie.password == BCrypt::Engine.hash_secret(password,salt) then
      zombie
    else
      nil
    end
  end

  def encriptar_pass
    if password.present? 
      salt = "$2a$10$c4NMmE26y3iH7Z7QPe3g3."
      self.password = BCrypt::Engine.hash_secret(password,salt)
    end
  end
end
