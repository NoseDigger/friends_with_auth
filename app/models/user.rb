class User < ApplicationRecord
    validates :name,presence: true
    validates :age, presence: true
    validates :city, presence: true
    validates :dob, presence: true
    validates :dob, presence: true
    belongs_to :authen

end
