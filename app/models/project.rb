class Project < ApplicationRecord 
    validates_presence_of :title,
                          :date_year,
                          :description,
                          :image_url,
                          :project_url
end
