class User < ActiveRecord::Base
    has_secure_password
    has_many :habits

    validates :email, presence: true
end
