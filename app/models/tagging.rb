class Tagging < ActiveRecord::Base
  belongs_to :message
  belongs_to :tag, dependent: :destroy
end
