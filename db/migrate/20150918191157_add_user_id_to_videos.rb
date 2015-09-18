class AddUserIdToVideos < ActiveRecord::Migration
  def change
    add_reference :videos, :user, index: true, foreign_key: true
  end
end
