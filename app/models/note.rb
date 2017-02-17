class Note < ActiveRecord::Base
  validates :user_id, :track_id, :body, presence: true

  belongs_to :track
  belongs_to :user
end
