require 'rails_helper'

feature "request features", type: :feature do
  feature "create a new request" do
    before(:each) do
      visit new_request_path
    end

    scenario "with invalid params" do
      fill_in "request_name", with: "Tintol"
      click_on "Submit"
      expect(current_path).to eq("/requests")
      expect(page).to have_content("Region can't be blank")
    end

    scenario "with valid params" do
      fill_in "request_name", with: "Tintol"
      fill_in "request_description", with: "test"
      fill_in "request_country", with: "test"
      fill_in "request_region", with: "test"
      fill_in "request_volume", with: "12"
      select "Tinto", from: "request_variant"
      click_on "Submit"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Thank you for your contribution!")
    end
  end
end
