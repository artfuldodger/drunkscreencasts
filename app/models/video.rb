class Video < ActiveRecord::Base
  def self.ordered
    order(:published_at).reverse_order
  end
end
