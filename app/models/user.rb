# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  session_token   :text             not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password

    validates :email, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, message: 'must be at least 6 characters'}

    def password=(password) # convert the current password to an encrypted version of it
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end
    
    def is_password!(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
end