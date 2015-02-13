class User < ActiveRecord::Base
	has_many :events, through: :users_events 
	has_many :users_events
	has_many :events, as: :creator

	has_secure_password

	# def events
	# 	@events_arr = [] #empty array
	# 	@user = User.where(id: self.id) #find the user
	# 	events = @user[0].users_events #find the event for the user throug the join table
	# 	users_events.each do |u| #looping through join table event for the user
	# 		@events_arr.push(u) #pushing each events into the array
	# 	end
	# 	@events_arr #returning array
	# end

end
