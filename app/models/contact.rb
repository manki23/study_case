class Contact < ActiveRecord::Base
  has_many :interest

  validates :name, presence: {
    message: "Name must be filled"
  }

  validates :phone, uniqueness: {
    message: "A contact already exist with this phone number"
  }

  validates :email, uniqueness: {
    message: "A contact already exist with this mail address"
  }
end
