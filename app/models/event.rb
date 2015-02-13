class Event < ActiveRecord::Base
	has_many :users, through: :users_events
	has_many :users_events
	belongs_to :creator, class_name: "User"


end
