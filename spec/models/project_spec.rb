require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :date_year }
  it { should validate_presence_of :description }
  it { should validate_presence_of :image_url }
  it { should validate_presence_of :project_url }


end
