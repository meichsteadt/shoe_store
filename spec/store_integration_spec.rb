require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('root through delete store pathway', {:type => :feature}) do
  it('goes through the whole process of creating a store and shoe') do
    visit('/')
    click_link('Stores')
    click_link('Add store')
    # select('option', :from => 'name of select tag')
    fill_in('name', :with => 'zUmiez')
    click_button('Submit')
    click_link('Zumiez')
    click_link('Add shoe')
    fill_in('name', :with => 'Vans')
    click_button('Submit')
    click_link('Vans')
    click_link('Zumiez')
    click_button('Delete store')
    expect(page).to have_content('bummer')
  end
end
