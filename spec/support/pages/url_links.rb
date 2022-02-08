class UrlLinks < SitePrism::Section
  element :short_url, :qa, 'url-link-short-url'
  element :long_url, :qa, 'url-link-long-url'
  element :show, :qa, 'url-link-action-show'
  element :edit, :qa, 'url-link-action-edit'
  element :destroy, :qa, 'url-link-action-destroy'
end
