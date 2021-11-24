require 'rails_helper'

RSpec.describe 'shorten links' do
  it 'allows creation of a short link, which redirects and gathers stats' do
    When "visit the app" do
      visit root_path
    end

    Then "see there are no links" do
      expect(
        page.find_all('tbody tr'),
      ).to be_empty
    end

    When "create a shortend link" do
      click_on('New Url')
      form = page.find("form[action=\"#{urls_path}\"]")
      long_url = "#{root_url}?test-1"
      form.fill_in('Long', with: long_url)
      form.find('.actions input[type=submit]').click
    end

    Then "successfully" do
      expect(
        page.find('#notice').text,
      ).to eq 'Url was successfully created.'
    end

    When "visit the shortend link once" do
      page.find('[data-testid=short-url]').click
    end

    Then "confirm the page" do
      expect(
        page.current_url,
      ).to eq 'http://www.example.com/?test-1'
    end

    When "visit the app" do
      visit root_path
    end

    Then "see there is 1 link" do
      expect(
        page.find_all('tbody tr').map(&:text),
      ).to match([
                /\d+ http:\/\/www.example.com\/\?test-1 Show Edit Destroy/
              ])
    end

    When "view the stats for that link" do
      page
        .find_all('tbody tr')
        .find { |row| row.text.include?('1') }
        .find('a', text: 'Show')
        .click
    end

    Then "the see the stats" do
      expect(
        page.find_all('ul li').map(&:text),
      ).to match([
        /ID: \d+ CREATED AT: 2021-11-24 \d+:\d+:\d+ UTC REMOTE ADDR: 127.0.0.1 SERVER NAME: www.example.com ACCEPT LANGUAGE: USER AGENT:/
      ])
    end
  end
end
