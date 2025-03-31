require 'rails_helper'

RSpec.describe 'Googleログイン', type: :feature do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123456',
      info: { email: 'test@example.com', name: 'Test User' }
    })
  end

  it 'Googleログインが成功する' do
    visit root_path
    click_on 'Googleでログイン'
    expect(page).to have_current_path root_path
    expect(page).to have_content('LoginUser: Test User')
  end

  it 'ログアウトが成功する' do
    visit root_path
    click_on 'Googleでログイン'
    click_on 'ログアウト'
    expect(page).to have_current_path root_path
    expect(page).not_to have_content('Test User')
  end
end
