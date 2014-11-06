class Message < ActiveRecord::Base
  has_many :taggings
  has_many :tags, :through => :taggings

  scope :tag_with, lambda{|tag_name| joins(:tags).where("tags.tag = ?", tag_name)}
  scope :latter_than, lambda{|time| joins(:taggings).where("taggings.created_at > ?", time)}



=begin
  def self.tag_with(tag_name)
    Tag.find_by_tag(tag_name).try(:messages)
  end
=end

end
