require 'support/pages/url_form'

class UrlPage < SitePrism::Page
  set_url '/urls'

  element :short_url, '[data-testid=short-url]'

  section :form, UrlForm, 'form[action="/urls"]'
  section :alert, Alert, '#notice'
  sections :stats, Stats, 'ul li'
end
