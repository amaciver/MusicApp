class Track < ActiveRecord::Base
  validates :album_id, :name, presence: true

  belongs_to :album

  has_many :notes

  has_one :band,
    through: :album,
    source: :band
end
