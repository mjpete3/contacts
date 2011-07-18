class Contacttype < ActiveRecord::Base
  
  has_one :user
  has_many :addressinfo
  has_many :contactinfo
  
  scope :logged_in_user, lambda {|user_id| where(:user_id => user_id)}
  
end
