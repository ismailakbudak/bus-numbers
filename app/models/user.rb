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
    validates :password, :length => { minimum: 6, maximum:40 },
                         :confirmation => true,
                         :on => :create    

    validates :password, :length => { minimum: 6, maximum:40 },
                         :confirmation => true,
                         :on => :update_password, 
                         :unless => lambda{ |user| user.password.blank? }

    validates :password, :confirmation => true, 
                         :length => { :within => 6..40 }, 
                         :on => :update, 
                         :unless => lambda{ |user| user.password.blank? }

    # remember me için eklendi
    def User.new_remember_token
	    SecureRandom.urlsafe_base64
	end

	def User.digest(token)
	  Digest::SHA1.hexdigest(token.to_s)
	end
    
    def fullname
        self.name.titleize #capitalize first letter
    end

	private

	    def create_remember_token
	      self.remember_token = User.digest(User.new_remember_token)
	    end

end
