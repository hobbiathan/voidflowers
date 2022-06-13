class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :date_year
      t.string :description
      t.string :project_url

      t.timestamps
    end
  end
end
