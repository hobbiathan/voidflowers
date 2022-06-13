class Project < ApplicationRecord
    validates_presence_of :title,
                          :date_year,
                          :description,
                          :project_url

    has_one_attached :image
end
