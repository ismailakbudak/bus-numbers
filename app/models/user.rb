class User < ActiveRecord::Base
    
    # some databases does not  support case_sensitive
	before_save { self.email = email.downcase }
    # remember me için eklendi
    before_create :create_remember_token

	# it is a method we can use like this => validates(:name, presence: true)
	validates :username, length: { maximum: 50 }   
	validates :name, presence: true, length: { maximum: 50 }   
	validates :surname, presence: true, length: { maximum: 50 }   

	validates :birth_date, length: { maximum: 10 }   
 	validates :country, length: { maximum: 60 }   
 	validates :city, length: { maximum: 60 }   
	validates :district, length: { maximum: 60 }   
   
	# uniqueness: true büyük küçük harf duyarlı değil
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
    
    # remember me için eklendi
    def User.new_remember_token
	    SecureRandom.urlsafe_base64
	end

	def User.digest(token)
	  Digest::SHA1.hexdigest(token.to_s)
	end
 
	private

	    def create_remember_token
	      self.remember_token = User.digest(User.new_remember_token)
	    end

end
