require 'bcrypt'

class User < ActiveRecord::Base
 include BCrypt

  def password
  @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end


  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "subscriber_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "poster_id", dependent: :destroy
  has_many :subscribing_to, through: :active_relationships, source: :poster
  has_many :subscribers, through: :passive_relationships, source: :subscriber
end
