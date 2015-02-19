class PressReleasesPage
  require 'date'
  include PageObject
  include RSpec::Matchers

  page_url "#{EnvConfig["base_url"]}/press/press-releases/"

  unordered_list :press_releases_list, css: "ul.stacked.press-releases"
  link :first_press_release, css: "ul.stacked.press-releases li:first-child a"
  div :left_side_area, id: "secondary"
  link :view_all_press_releases, text: "View all press releases"

  link :news, text: "News"
  link :view_all_news, text: "View all news"
  element :news_articles, :article, xpath: "//*[contains(@class, 'category-news')]"
  link :first_news_article, css: "article:nth-child(2) h2 a"
  span :publish_date, css: "div.article-meta__date span"
  link :print_page, css: "div.article-meta__print a"
  link :copy_page_url, css: "div.article-meta__copyurl a"
  link :share_button, css: "div.article-meta__share a"
  link :dwn_press_release, text: "Download press release"
  link :logout, text: "Logout"
  text_field :copy_url_field, css: "div.article-meta__copyurl input"

end