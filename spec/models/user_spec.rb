require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relationships' do

  end

  context 'attributes' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }

    it { should have_secure_password }
  end
end
