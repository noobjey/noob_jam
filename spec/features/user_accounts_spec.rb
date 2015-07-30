require 'rails_helper'

RSpec.feature 'UserAccounts', type: :feature do

  scenario 'user can create account' do
    visit new_user_path

    expect(page).to have_content('Create Account')
    expect(page).to have_field(:user_username)
    expect(page).to have_field(:user_password)

    username = 'joe'
    fill_in :user_username, with: username
    fill_in :user_password, with: 'dirt'
    click_button 'Sign Up'

    expect(page).to have_content("Hello #{username}")
  end

  scenario 'user view account details' do
    username = 'joe'
    password = 'dirt'
    User.create(username: username, password: password)
    @user = User.find_by(username: username)

    visit user_path(@user.id)

    expect(page).to have_content("#{username}'s Account")
    expect(find('th')).to have_content('Username')
    expect(find('tr')).to have_content("#{username}")
  end
end
