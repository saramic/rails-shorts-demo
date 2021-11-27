require 'support/pages/url_links'

class Root < SitePrism::Page
  set_url '/'
  element :new_url, 'a', text: 'New Url'
  sections :url_links, UrlLinks, '[data-testid=url-link]'
end
