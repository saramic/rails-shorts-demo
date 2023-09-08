require 'support/pages/url_form'

module Pages
  class UrlPage < SitePrism::Page
    set_url '/urls'

    element :short_url, '[data-testid=short-url]'

    section :form, Pages::UrlForm, 'form[action="/urls"]'
    section :alert, Pages::Alert, '#notice'
    sections :stats, Pages::Stats, 'main ul li'
  end
end
