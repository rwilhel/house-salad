require 'rails_helper'

RSpec.describe "A user can view house member information for Colorado" do
  scenario "A user can view information for all members of CO's house" do

    visit "/"

    select('Colorado', from: 'state')
    click_on "Locate Members of the House"

    expect(current_path).to eq('/search')
    expect(page).to have_content("7 Results")
    expect(page).to have_selector(".member", count: 7)

    within first(".member") do
      expect(page).to have_selector(".member_name")
      expect(page).to have_selector(".member_role")
      expect(page).to have_selector(".member_party")
      expect(page).to have_selector(".member_district")
    end
  end
end