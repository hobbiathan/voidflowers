require 'rails_helper'

RSpec.describe "Projects" do
  before(:each) do
    @user = User.create!(username: "bighubert", password: "password", password_confirmation: "password")
  end

  context 'no sessions' do
    it 'shows restricted access' do
      visit "/projects"
      expect(page).to have_content(/access restricted./)
    end
  end

  context 'has session' do
    it "properly logs in" do
      visit "/login"
      fill_in 'Username', :with => 'bighubert'
      fill_in 'Password', :with => 'password'

      click_button("login")

      expect(current_path).to eq("/projects")
      expect(page).to have_content(/login successful/)
      expect(page).to have_content("logged in as: #{@user.username}")
    end
  end

  it 'can log out' do
        visit "/login"
    fill_in 'Username', :with => 'bighubert'
    fill_in 'Password', :with => 'password'

    click_button("login")

    expect(current_path).to eq("/projects")
    expect(page).to have_content(/login successful/)
    expect(page).to have_content("logged in as: #{@user.username}")

    click_button("logout")

    expect(page).to have_content(/logged out./)
    expect(page).to have_content(/access restricted./)
  end
end
