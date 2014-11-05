class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :messages, :through => :taggings
end
