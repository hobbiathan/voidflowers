class Song < ApplicationRecord
  validates_presence_of :title,
                        :album,
                        :link,
                        :artist
end
