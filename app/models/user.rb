class User < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:token) }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, :presence => true,
            :uniqueness => {:case_sesitive => false}
  validates :password, :length => { :minimum => 6 },
            :on => :create
  validates :email, :presence => true,
            :uniqueness => {:case_sesitive => false},
            format:{with:EMAIL_REGEX}

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
