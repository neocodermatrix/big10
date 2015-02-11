class User < ActiveRecord::Base
	has_many :users_events
	has_many :events, through: :user_events 






end
