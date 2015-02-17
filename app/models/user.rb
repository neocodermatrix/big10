class User < ActiveRecord::Base
	has_many :events_attending, through: :users_events, class_name: Event, source: :event, dependent: :destroy  #events users are attending
	has_many :users_events, dependent: :destroy
	has_many :created_events, class_name: Event, foreign_key: "creator_id", dependent: :destroy
	#has_many :events, as: :creator
	#has_many :events, inverse_of: :creator

	has_secure_password

	# def created_events
	# 	Event.where(creator: self)
	# 	#u.created_events.  return an array of all events.
	# 	#self refers to the user that's calling the method.
	# 	#instance method a method thats called by an instance of the class.
	# 	#a speciifc user is calling the method.
	# end



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
