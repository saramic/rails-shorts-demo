require 'rails_helper'

RSpec.describe 'shorten links', js: true do
  around do |example|
    travel_to Time.zone.local(2021, 11, 20, 10, 10, 0)
    example.run
    travel_back
  end

  it 'allows creation of a short link, which redirects and gathers stats' do
    When 'visit the app' do
      app.root.load
    end

    Then 'see there are no links' do
      expect(app.root.url_links).to be_empty
    end

    When 'create a shortend link' do
      app.root.new_url.click
      app.url_page.form.long.set "#{root_url}?test-1"
      app.url_page.form.submit.click
    end

    Then 'successfully' do
      expect(app.url_page.alert).to have_text 'Url was successfully created.'
    end

    When 'visit the shortend link once' do
      app.url_page.short_url.click
    end

    Then 'confirm the page' do
      expect(
        page.current_url,
      ).to eq 'http://www.example.com/?test-1'
    end

    When 'visit the app' do
      app.root.load
    end

    Then 'see there is 1 link' do
      expect(app.root.url_links.first).to have_text 'http://www.example.com/?test-1'
    end

    When 'view the stats for that link' do
      app.root.url_links.find { |url_link| url_link.long_url.text.include?('test-1') }.show.click
    end

    Then 'the see the stats' do
      expect(app.url_page.stats.first.created_at).to have_text '2021-11-20 10:10:00 UTC'
      expect(app.url_page.stats.first.remote_addr).to have_text '127.0.0.1'
      expect(app.url_page.stats.first.accept_language).to have_text 'en-GB'
      expect(app.url_page.stats.first.user_agent).to have_text 'Mozilla/5.0'
      expect(app.url_page.stats.length).to eq 1
    end
  end
end
