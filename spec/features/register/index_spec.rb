require 'rails_helper'

RSpec.describe 'Register Index' do
  before(:each) do
    visit "/register"
  end

  context "valid registration" do
    it "registers" do

      fill_in(:username, with: "bighubert")
      fill_in(:password, with: "iamawesome")
      fill_in(:password_confirmation, with: "iamawesome")
      fill_in(:uniqkey, with: ENV["UNIQ"])

      click_button("Register")

      expect(current_path).to eq("/")
    end
  end

  context "invalid registration" do
    it 'does not have unique username' do
      User.create!(username: "bighubert", password: "password", password_confirmation: "password")

      fill_in(:username, with: "bighubert")
      fill_in(:password, with: "iamawesome")
      fill_in(:password_confirmation, with: "iamawesome")
      fill_in(:uniqkey, with: ENV["UNIQ"])

      click_button("Register")

      expect(current_path).to eq("/register")
      expect(flash[:alert]).to match(/Username taken./)
    end

    it 'does not have username' do
      fill_in(:username, with: "bighubert")
      fill_in(:password, with: "iamawesome")
      fill_in(:password_confirmation, with: "iamawesome")
      fill_in(:uniqkey, with: ENV["UNIQ"])

      click_button("Register")

      expect(current_path).to eq("/register")
      expect(flash[:alert]).to match(/Username not provided./)
    end

    it 'does not have password' do
      fill_in(:username, with: "bighubert")
      fill_in(:password, with: "")
      fill_in(:password_confirmation, with: "iamawesome")
      fill_in(:uniqkey, with: ENV["UNIQ"])

      click_button("Register")

      expect(current_path).to eq("/register")
      expect(flash[:alert]).to match(/Password not provided./)
    end

    it 'does not have password confirmation' do
      fill_in(:username, with: "bighubert")
      fill_in(:password, with: "iamawesome")
      fill_in(:password_confirmation, with: "")
      fill_in(:uniqkey, with: ENV["UNIQ"])

      click_button("Register")

      expect(current_path).to eq("/register")
      expect(flash[:alert]).to match(/Password confirmation not provided./)
    end

    it 'does not have matching passwords' do
      fill_in(:username, with: "bighubert")
      fill_in(:password, with: "iamawesome")
      fill_in(:password_confirmation, with: "oasdhjfadosufasdf")
      fill_in(:uniqkey, with: ENV["UNIQ"])

      click_button("Register")

      expect(current_path).to eq("/register")
      expect(flash[:alert]).to match(/Passwords do not match./)
    end

    it 'does not provide uniqkey' do
      fill_in(:username, with: "bighubert")
      fill_in(:password, with: "iamawesome")
      fill_in(:password_confirmation, with: "iamawesome")
      fill_in(:uniqkey, with: "")

      click_button("Register")

      expect(current_path).to eq("/register")
      expect(flash[:alert]).to match(/Uniqkey not provided./)
    end

    it 'provides incorrect uniqkey' do
      fill_in(:username, with: "bighubert")
      fill_in(:password, with: "iamawesome")
      fill_in(:password_confirmation, with: "iamawesome")
      fill_in(:uniqkey, with: "thisisavalidkey")

      click_button("Register")

      expect(current_path).to eq("/register")
      expect(flash[:alert]).to match(/Uniqkey invalid./)
    end
  end
end
