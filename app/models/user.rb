# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  email            :string           not null
#  session_token    :text             not null
#  password_digest  :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activated        :boolean          default(FALSE)
#  activation_token :text
#  admin            :boolean          default(FALSE)
#
class User < ApplicationRecord
    attr_reader :password

    # validates :activated, :presence => true
    validates :activation_token, presence: true
    validates :email, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true, uniqueness: true
    validates :password , length: {minimum: 6, message: 'must be at least 6 characters', allow_nil: true}
    after_initialize :ensure_session_token
    after_initialize :ensure_activation_token

    has_many :tracks, :class_name => 'Track'
    # make the password encrypted and hash it with BCrypt
    def password=(password) # convert the current password to an encrypted version of it
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end
    
    def is_password!(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    # Make a session token

    def self.generate_session_token
        SecureRandom.urlsafe_base64(16)
    end

    def self.generate_activation_token
        SecureRandom.alphanumeric
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.session_token        
    end

    # Check if the user in the db
    
    def self.find_by_credentials!(email,password)
        user = User.find_by(:email => email)
        return nil if user.nil?
        if user.is_password!(password)
            user
        end
    end

    private 

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def ensure_activation_token
        self.activation_token ||= self.class.generate_activation_token
    end
end
