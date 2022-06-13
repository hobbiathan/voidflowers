require 'rails_helper'

RSpec.describe "Index" do
  it "is under construction lol" do
    visit "/"
    expect(page).to have_content(/under construction./)
  end
end
