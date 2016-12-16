require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('root through delete store pathway', {:type => :feature}) do
  it('goes through the whole process of creating a store and shoe') do
    visit('/')
    click_link('Shoes')
    click_link('Add shoe')
    # select('option', :from => 'name of select tag')
    fill_in('name', :with => 'Vans')
    click_button('Submit')
    click_link('Vans')
    click_button('Delete shoe')
    expect(page).to have_content('bummer')
  end
end
