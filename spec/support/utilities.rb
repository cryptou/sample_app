include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara.
  cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success')
  end
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error')
  end
end

RSpec::Matchers.define :have_notice_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-notice')
  end
end

RSpec::Matchers.define :have_title do |page_title|
  match do |page|
    page.should have_selector('title', text: full_title(page_title))
  end
end

RSpec::Matchers.define :have_top_level_header do |header_text|
  match do |page|
    page.should have_selector('h1', text: header_text)
  end
end