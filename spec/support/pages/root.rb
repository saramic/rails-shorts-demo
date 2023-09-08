require 'support/pages/url_links'

module Pages
  class Root < SitePrism::Page
    set_url '/'
    element :new_url, 'a', text: 'NEW URL'
    sections :url_links, Pages::UrlLinks, :qa, 'url-link'
  end
end
