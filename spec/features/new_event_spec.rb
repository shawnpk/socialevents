require 'rails_helper'

RSpec.describe 'Creating a new event' do
  it 'adds the event to the index page' do
    visit root_path
    click_link 'Add Event'

    fill_in 'Title',        with: 'Event #1'
    fill_in 'Description',  with: 'Event #1 description'
    fill_in 'Venue',        with: 'Event #1 venue'
    fill_in 'Location',     with: 'Event #1 location'
    click_button 'Create Event'

    expect(page).to have_content 'Event #1'

    click_link 'Back'

    expect(page).to have_selector 'h1'
    expect(page).to have_content 'Event #1'
  end
end
