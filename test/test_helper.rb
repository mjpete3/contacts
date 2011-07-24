ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def public_menu_displayed
    assert_tag :tag => "a", :attributes => { :href => "/home/index"}, :content => "Home"
    assert_tag :tag => "a", :attributes => { :href => "/users/sign_up"}, :content => "Register"
    assert_tag :tag => "a", :attributes => { :href => "/users/sign_in"}, :content => "Login"
    assert_no_tag :tag => "a", :content => "Contacts"
    assert_no_tag :tag => "a", :content => "Companies"
    assert_no_tag :tag => "a", :content => "Calendar"
    assert_no_tag :tag => "a", :content => "Admin"
    assert_no_tag :tag => "a", :content => "Logout"
  end
  
  def private_menu_displayed
    assert_tag :tag => "a", :attributes => { :href => "/home/index"}, :content => "Home"
    assert_tag :tag => "a", :attributes => { :href => "/people"}, :content => "Contacts"
    assert_tag :tag => "a", :attributes => { :href => "/home/index"}, :content => "Companies"
    assert_tag :tag => "a", :attributes => { :href => "/home/index"}, :content => "Calendar"
    assert_tag :tag => "a", :attributes => { :href => "/admin/index"}, :content => "Admin"
    assert_tag :tag => "a", :attributes => { :href => "/users/sign_out"}, :content => "Logout"    
    assert_no_tag :tag => "a", :content => "Register"
    assert_no_tag :tag => "a", :content => "Login"
  end
  
end
