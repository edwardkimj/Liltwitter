class User < ActiveRecord::Base
 # has_many :posts

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "subscriber_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "poster_id", dependent: :destroy
  has_many :subscribing_to, through: :active_relationships, source: :poster
  has_many :subscribers, through: :passive_relationships, source: :subscriber
end
