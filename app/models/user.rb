#require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
	has_many :events_attending, through: :users_events, class_name: Event, source: :event, dependent: :destroy  #events users are attending
	has_many :users_events, dependent: :destroy
	has_many :created_events, class_name: Event, foreign_key: "creator_id", dependent: :destroy
	has_many :posts, foreign_key: "user_id", dependent: :destroy
	has_many :requestor, through: :event_requests
	has_many :receiving, through: :event_requests

    has_many :friendships
    has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    #passive_friendshhip is other user requesting

    has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
    has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
    has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
    has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user
	#mount_uploader :image, AvatarUploader
	mount_uploader :image, AvatarUploader
    has_many :photos


    def friends
      active_friends | passive_friends
    end


	has_secure_password

	# attr_reader :password

	validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :password, presence: true, confirmation: true, length: { in: 6..20 }

      # def password=(unencrypted_password)
      #   unless unencrypted_password.empty?
      #     @password = unencrypted_password
      #     self.password_digest = BCrypt::Password.create(unencrypted_password)
      #   end
      # end
      
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
