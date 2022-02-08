require 'support/pages/url_links'

class Root < SitePrism::Page
  set_url '/'
  element :new_url, 'a', text: 'NEW URL'
  sections :url_links, UrlLinks, :qa, 'url-link'
end
