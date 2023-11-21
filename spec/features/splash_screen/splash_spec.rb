require 'rails_helper'

RSpec.feature 'Splash Page', type: :feature do
  scenario 'user sees the splash page' do
    visit root_path

    expect(page).to have_selector('h2', text: 'Budget App')

    expect(page).to have_link('Log In', href: new_user_session_path, class: 'btn btn-light splash-btn btn-block')
    expect(page).to have_link('Sign Up', href: new_user_registration_path, class: 'btn btn-light splash-btn btn-block')
  end
end
