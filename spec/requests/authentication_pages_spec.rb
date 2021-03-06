require 'spec_helper'

describe 'Authentication' do
  subject { page }  

  describe 'signin page' do
    before { visit signin_path }

    it { should have_selector('h1', text: 'Sign in' ) }
    it { should have_selector('title', text: 'Sign in') }
  end

  describe 'signin' do
    before { visit signin_path }

    describe 'with invalid information' do
      before { click_button 'Sign in'}

      it { should have_selector('title', text: 'Sign in') }
      it { should have_error_message('Invalid') }
    end

    describe 'with valid information' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        valid_signin(user)
      end
# => FIXME: fixed these tests with book 'The RSpec books'
#      it { should have_selector('title', text: user.name) }
#      it { should have_selector('a','Sign out', href: signout_path) }
    end

# => FIXME: fixed these tests with book 'The RSpec books'
=begin
    describe 'after visiting another page' do
      before { click_link 'Home' }

      it { should_not have_selector('div.alert.alert-error') }
    end


    describe 'with valid information' do
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign in'
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('Users', href: users_path) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
=end

  end

  describe 'authorization' do

    describe 'for non-signed-in users' do
      let(:user) { FactoryGirl.create(:user) }

      describe 'when attempting to visit a protected page' do
        
        subject { page }

        before do
          valid_signin user
          visit edit_user_path(user)
        end

        describe 'after signing in' do

          it { should have_selector('title', text: 'Edit user') }
      
        end

      end

      describe 'in the Users controller' do

        describe 'visiting the edit page' do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Sign in')  }
        end

        describe 'submitted to the update action' do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end

        describe 'visiting the user index' do
          before { visit users_path }
          it { should have_selector('title', text: 'Sign in') }
        end

      end
    end

    describe 'as wrong user' do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: 'wrong@example.com') }
      
      before { valid_signin user }    

      describe 'visiting Users#edit page' do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit user')) }
      end

      describe 'submitted a PUT request to the Users#update action' do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end

    describe 'as a non-admin user' do 
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user)}

      before { valid_signin non_admin }

      describe 'submitting a DELETE requrest to the Users#destroy action' do 
        before { delete user_path(user) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end
end

