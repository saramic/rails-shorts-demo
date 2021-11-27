class UrlLinks < SitePrism::Section
  element :short_url, '[data-testid=url-link-short-url]'
  element :long_url, '[data-testid=url-link-long-url]'
  element :show, '[data-testid=url-link-action-show]'
  element :edit, '[data-testid=url-link-action-edit]'
  element :destroy, '[data-testid=url-link-action-destroy]'
end
