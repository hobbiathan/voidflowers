require 'rails_helper'

RSpec.describe "Login" do
  before(:each) do
    @user = User.create!(username: "bighubert", password: "password", password_confirmation: "password")
  end

  it 'can login properly' do
    visit "/login"
    fill_in 'Username', :with => 'bighubert'
    fill_in 'Password', :with => 'password'

    click_button("login")

    expect(current_path).to eq("/projects")
    expect(page).to have_content(/login successful/)
    expect(page).to have_content("logged in as: #{@user.username}")
  end

  it 'will show flash if cannot login (bad username)' do
    visit "/login"
    fill_in 'Username', :with => 'fathubert'
    fill_in 'Password', :with => 'password'

    click_button("login")

    expect(current_path).to eq("/login")
    expect(page).to have_content("invalid username/password.")
  end

  it 'will show flash if cannot login (bad password)' do
    visit "/login"
    fill_in 'Username', :with => 'bighubert'
    fill_in 'Password', :with => 'awesomepasswordlol'

    click_button("login")

    expect(current_path).to eq("/login")
    expect(page).to have_content("invalid username/password.")
  end
end
