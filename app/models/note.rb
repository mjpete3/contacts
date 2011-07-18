class Note < ActiveRecord::Base
  
  has_one :user
  has_one :person
  
  scope :logged_in_user, lambda {|user_id| where(:user_id => user_id)}
  
end
