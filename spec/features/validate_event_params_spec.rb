require 'rails_helper'

RSpec.describe 'Creating a new event' do
  let(:today) { Date.today }

  before(:each) do
    visit root_path
    click_link 'Add Event'
  end

  it 'cannot succeed without a title' do
    fill_in 'Title', with: ''
    click_button 'Create Event'

    expect(page).to have_content 'Title can\'t be blank'
  end

  it 'must have a title of at least 5 characters' do
    fill_in 'Title', with: 'abcd'
    click_button 'Create Event'

    expect(page).to have_content 'Title is too short (minimum is 5 characters)'
  end

  it 'cannot succeed without a description' do
    fill_in 'Description', with: ''
    click_button 'Create Event'

    expect(page).to have_content 'Description can\'t be blank'
  end

  it 'cannot succeed if the start date is before today' do
    fill_in 'Title',        with: 'Event #1'
    fill_in 'Description',  with: 'Event #1 description'
    fill_in 'Venue',        with: 'Event #1 venue'
    fill_in 'Location',     with: 'Event #1 location'
    select '2018', :from => 'event_start_date_1i'
    select 'January', :from => 'event_start_date_2i'
    select '5', :from => 'event_start_date_3i'
    select '06', :from => 'event_start_date_4i'
    select '10', :from => 'event_start_date_5i'
    click_button 'Create Event'

    expect(page).to have_content "Start date must be on or after #{Date.today}"
  end

  it 'cannot succeed if the end date is before today' do
    fill_in 'Title',        with: 'Event #1'
    fill_in 'Description',  with: 'Event #1 description'
    fill_in 'Venue',        with: 'Event #1 venue'
    fill_in 'Location',     with: 'Event #1 location'
    select '2018', :from => 'event_end_date_1i'
    select 'January', :from => 'event_end_date_2i'
    select '5', :from => 'event_end_date_3i'
    select '06', :from => 'event_end_date_4i'
    select '10', :from => 'event_end_date_5i'
    click_button 'Create Event'

    expect(page).to have_content "End date must be on or after #{Date.today}"
  end

  it 'cannot succeed without a venue' do
    fill_in 'Description', with: ''
    click_button 'Create Event'

    expect(page).to have_content 'Venue can\'t be blank'
  end

  it 'cannot succeed without a location' do
    fill_in 'Description', with: ''
    click_button 'Create Event'

    expect(page).to have_content 'Location can\'t be blank'
  end
end
