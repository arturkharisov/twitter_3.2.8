require 'spec_helper'

describe  'Static Pages' do
  describe 'Home page' do
    it  'should have the content \'Sample Page\'' do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end

    it  'should have the \'Home\'' do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
  end

  describe 'Help page' do
    it  'should have the content \'Help Page\'' do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it  'should have the \'Help\'' do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
  end

  describe 'About page' do
    it  'should have the content \'About Us\'' do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it  'should have the \'About\'' do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end
  end

end
