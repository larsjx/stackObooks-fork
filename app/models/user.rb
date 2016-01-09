class User < ActiveRecord::Base
  has_many :posts
  has_many :responses
  has_many :votes
  validates :username, presence: true
  validates :username, uniqueness: true
  validate :password_requirements

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

  private

  def raw_password
    @raw_password
  end

  def password_requirements
    if raw_password || new_record?
      if raw_password.length < 2
        errors.add(:password, "must be at least 2 characters long.")
      end
    end
  end
end
