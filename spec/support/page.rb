class PageApp
  # TODO: could do this automatically by reading files from spec/support/pages
  def root
    @root ||= Root.new
  end

  def url_page
    @url_page ||= UrlPage.new
  end
end
