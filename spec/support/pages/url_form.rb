class UrlForm < SitePrism::Section
  element :long, 'input#url_long'
  element :submit, '.actions input[type=submit]'
end
