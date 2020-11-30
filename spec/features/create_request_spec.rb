require 'rails_helper'

RSpec.describe 'Creating a request', type: :feature do
  fixtures :users

  scenario 'valid inputs' do
    @user = users(:marco)
    sign_in @user

    visit new_request_path
    fill_in 'Name', with: 'Adega do Teste'
    find('#request_variant').find(:xpath, 'option[2]').select_option
    fill_in 'Maker', with: 'Teste'
    fill_in 'Volume', with: "10"
    fill_in 'Country', with: 'Portugal'
    fill_in 'Region', with: 'Douro'
    fill_in 'Description', with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'
    click_on 'Submit'

    visit requests_path
    save_and_open_page
    expect(page).to have_content('Adega do Teste')
  end
end
