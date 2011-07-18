require 'app/helpers/paginate_alphabetically'

class Person < ActiveRecord::Base
  
  has_one :user
  has_many :addressinfos
  has_many :contactinfos 
  has_many :notes
  
  scope :logged_in_user, lambda {|user_id| where(:user_id => user_id)}
  
  paginate_alphabetically :by => :last_name
  
  validates_presence_of :first_name, :message => "Cannot be left blank"
  validates_presence_of :last_name, :message => "Cannot be left blank."
  
  
end
