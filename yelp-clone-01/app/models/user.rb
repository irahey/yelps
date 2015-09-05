class User < ActiveRecord::Base
    has_many :reviews
    #has_secure_password
    before_validation :prep_email
    before_save :create_avatar_url
    
    

    validates :email, uniqueness: true, presence: true, format: { with: /@/ } #format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }
    validates :username, uniqueness: true, presence: true
    validates :name, presence: true
    validates :password_digest, presence: true, :on => :create
=begin
  def self.authenticate(username, password_digest)
    user = find_by_username(username)
    if user && user.password_digest_hash == BCrypt::Engine.hash_secret(password_digest, user.password_digest_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password_digest.present?
      self.password_digest_salt = BCrypt::Engine.generate_salt
      self.password_digest_hash = BCrypt::Engine.hash_secret(password_digest, password_digest_salt)
    end
  end
=end

    def self.authenticate(username="", password_digest="")
        user = User.find_by_username(username)
      
        if user && user.match_password(password_digest)
            return user
        else
            return false
        end
    end   
    def match_password(password_digest="")
      encrypted_password == BCrypt::Engine.hash_secret(password_digest, salt)
    end
    def reviewed?(establishment)
      reviews.where(establishment_id: establishment.id).any?
    end

    def create_avatar_url
        self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
        #self.avatar_url = "{:avatar_url}?s=50"
    end
    
    private
     
    def prep_email
        self.email = self.email.strip.downcase if self.email
    end
end
