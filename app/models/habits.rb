class Habits < ActiveRecord::Base
    belongs_to :user
    validates :name, :date, :description, presence: true
end 
