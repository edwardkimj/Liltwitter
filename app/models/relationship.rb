class Relationship < ActiveRecord::Base

  belongs_to :subscriber, class_name: "User"
  belongs_to :poster, class_name: "User"
  validates :subscriber_id, presence: true
  validates :poster_id, presence: true
end
