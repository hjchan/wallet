require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    provider: "google_oauth2",
      uid: "12345678910",
      info: {
        email: "jesse@mountainmantechnologies.com",
        name: "Testing",
      },
      credentials: {
        token: "abcdefg12345",
        expires_at: DateTime.now,
      }
  })
end

RSpec.feature "GoogleLogins", type: :feature do
  scenario "using google oauth2" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
    expect(page).to have_link("Log Out")
  end
end
