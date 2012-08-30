require 'spec_helper'

describe  'Static Pages' do

  let(:base_title) {'Ruby on Rails Tutorial Sample App'}

  describe 'Home page' do
    
    it 'should have the h1 \'Sample App\'' do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Home')
    end

    it  'should have the \'Home\'' do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
  end

  describe 'Help page' do
    it  'should have the content \'Help Page\'' do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it  'should have the \'Help\'' do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe 'About page' do
    it  'should have the content \'About Us\'' do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it  'should have the \'About\'' do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end

end
