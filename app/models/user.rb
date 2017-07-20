class User < ApplicationRecord
  has_secure_password
  has_many :contestants

  enum role: %w(default admin)
end
