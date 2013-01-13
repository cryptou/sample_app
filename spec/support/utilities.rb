include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error')
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

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success')
  end
end