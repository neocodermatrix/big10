class User < ActiveRecord::Base
	has_many :events, through: :users_events 
	has_many :users_events
	has_many :events, as: :creator

	has_secure_password



end
