class User < ActiveRecord::Base
    has_secure_password
    has_many :habits

    validates_uniqueness_of :email
end
