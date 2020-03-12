class ContactInterest < ActiveRecord::Base
  validates :contact_id, presence: {
    message: "contact_id must be filled"
  }

  validates :interest_id, presence: {
    message: "interest_id must be filled"
  }
end
