class NewsletterSubscriber < ActiveRecord::Base
  has_many :contact

  validates :subscriber_id, presence: {
    message: "subscriber id missing"
  }
end
