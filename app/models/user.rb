class User < ActiveRecord::Base
  has_secure_password

  def self.alphabetized
    order(:name)
  end
end
