require 'rails_helper'

RSpec.describe 'shorten links', js: true do
  around do |example|
    travel_to Time.zone.local(2021, 11, 20, 10, 10, 0)
    example.run
    travel_back
  end

  let(:root) { Root.new }
  let(:url_page) { UrlPage.new }

  it 'allows creation of a short link, which redirects and gathers stats' do
    When "visit the app" do
      root.load
    end

    Then "see there are no links" do
      expect(root.url_links).to be_empty
    end

    When "create a shortend link" do
      root.new_url.click
      url_page.form.long.set "#{root_url}?test-1"
      url_page.form.submit.click
    end

    Then "successfully" do
      expect(url_page.alert).to have_text 'Url was successfully created.'
    end

    When "visit the shortend link once" do
      url_page.short_url.click
    end

    Then "confirm the page" do
      expect(
        page.current_url,
      ).to eq 'http://www.example.com/?test-1'
    end

    When "visit the app" do
      root.load
    end

    Then "see there is 1 link" do
      expect(root.url_links.first).to have_text 'http://www.example.com/?test-1'
    end

    When "view the stats for that link" do
      root.url_links.find { |url_link| url_link.long_url.text.include?('test-1') }.show.click
    end

    Then "the see the stats" do
      expect(url_page.stats.first.created_at).to have_text "2021-11-20 10:10:00 UTC"
      expect(url_page.stats.first.remote_addr).to have_text "127.0.0.1"
      expect(url_page.stats.first.accept_language).to have_text "en-GB"
      expect(url_page.stats.first.user_agent).to have_text "Mozilla/5.0"
      expect(url_page.stats.length).to eq 1
    end
  end
end
