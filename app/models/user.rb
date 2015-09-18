class User < ActiveRecord::Base
  has_secure_password

  has_many :videos

  def self.alphabetized
    order(:name)
  end

  def name
    super.presence || login
  end
end
