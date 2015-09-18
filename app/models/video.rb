class Video < ActiveRecord::Base
  belongs_to :user

  def self.ordered
    order(:published_at).reverse_order
  end

  def editable_by?(user)
    user && (user.admin? || owned_by?(user))
  end

  def owned_by?(user)
    self.user == user
  end
end
