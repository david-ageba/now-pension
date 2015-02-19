When(/^I click on the Press link$/) do
  on(HomePage).press
end

Then(/^I will see a list of press releases$/) do
  expect(on(PressReleasesPage).press_releases_list?).to be true
end

And(/^some Press Contact information$/) do
  expect(on(PressReleasesPage).left_side_area.include? 'Press Contact - Primary').to be true
end

And(/^a "View all press releases" button$/) do
  expect(on(PressReleasesPage).view_all_press_releases?).to be true
end

When(/^I click on the first press release$/) do
  on(PressReleasesPage).first_press_release
end

Then(/^I will see the press release's publishing date$/) do
  Utility.validate_date_format "%d %m %y", on(PressReleasesPage).publish_date
end

And(/^a "Print this page" button$/) do
  expect(on(PressReleasesPage).print_page?).to be true
end

And(/^a "Copy this page link" button$/) do
  expect(on(PressReleasesPage).copy_page_url?).to be true
end

And(/^a "Share" button$/) do
  expect(on(PressReleasesPage).share_button?).to be true
end

And(/^a "Download press release" button$/) do
  expect(on(PressReleasesPage).dwn_press_release?).to be true
end

When(/^I click on the "Print this page" link$/) do
  @browser.execute_script("window.print = function() {return 'Print page';};")
  on(PressReleasesPage).print_page
end

Then(/^a print page popup shows up$/) do
  expect(@browser.text.include? 'Print page').to be true
  @browser.back
end

When(/^I click on the "Copy this page link" button$/) do
  on(PressReleasesPage).copy_page_url
  Clipboard.copy on(PressReleasesPage).copy_url_field
end

Then(/^the clipboard should contain the link of the press release$/) do
  expect(@browser.url == Clipboard.paste).to be true
end

When(/^I click on the News link$/) do
  on(PressReleasesPage).news
end

Then(/^I will see a list of News$/) do
  expect(on(PressReleasesPage).news_articles?).to be true
end

When(/^I click on the first News article$/) do
  on(PressReleasesPage).first_news_article
end

Then(/^I will see the News' publishing date$/) do
  Utility.validate_date_format "%d %m %y", on(PressReleasesPage).publish_date
end

And(/^a "View all news" button$/) do
  expect(on(PressReleasesPage).view_all_news?).to be true
end

Then(/^I click Logout$/) do
  on(PressReleasesPage).logout
end