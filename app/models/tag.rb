class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :messages, :through => :taggings

  def self.remove_dup(tags)
    array_tags = Array.new
    tags.each do |tag|
      array_tags.push(tag.tag)
    end
    array_tags.uniq
  end

end
