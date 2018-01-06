require 'rails_helper'

RSpec.describe 'Deleting an event' do
  it 'removes the event from the index page' do
    visit root_path
    click_link 'Add Event'

    fill_in 'Title',        with: 'Event #1'
    fill_in 'Description',  with: 'Event #1 description'
    fill_in 'Venue',        with: 'Event #1 venue'
    fill_in 'Location',     with: 'Event #1 location'
    click_button 'Create Event'

    expect(page).to have_content 'Event #1'

    click_link 'Delete'

    expect(page).not_to have_content 'Event #1'
  end
end
