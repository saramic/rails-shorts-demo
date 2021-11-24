require 'rails_helper'

RSpec.describe 'shorten links' do
  it 'allows creation of a short link, which redirects and gathers stats' do
    # visit the app
    visit root_path

    # see there are no links
    expect(
      page.find_all('tbody tr'),
    ).to be_empty

    # create a shortend link
    click_on('New Url')
    form = page.find("form[action=\"#{urls_path}\"]")
    long_url = "#{root_url}?test-1"
    form.fill_in('Long', with: long_url)
    form.find('.actions input[type=submit]').click

    # successfully
    expect(
      page.find('#notice').text,
    ).to eq 'Url was successfully created.'

    # visit the shortend link once
    page.find('[data-testid=short-url]').click

    # confirm the page
    expect(
      page.current_url,
    ).to eq 'http://www.example.com/?test-1'

    # visit the app
    # see there is 1 link
    expect(
      page.find_all('tbody tr').map(&:text),
    ).to match([
              /\d+ http:\/\/www.example.com\/\?test-1 Show Edit Destroy/
            ])

    # view the stats for that link
    page
      .find_all('tbody tr')
      .find { |row| row.text.include?('1') }
      .find('a', text: 'Show')
      .click

    expect(
      page.find_all('ul li').map(&:text),
    ).to match([
      /ID: \d+ CREATED AT: 2021-11-24 \d+:\d+:\d+ UTC REMOTE ADDR: 127.0.0.1 SERVER NAME: www.example.com ACCEPT LANGUAGE: USER AGENT:/
    ])
  end
end
