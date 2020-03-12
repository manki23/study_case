class Interest < ActiveRecord::Base
  validates :name, presence: {
    message: "Interest must have a name."
  }

  validates :name, uniqueness: {
    message: "Interest already exists."
  }
end
