class Event < ActiveRecord::Base
  	
	has_many :users, through: :users_events
	has_many :users_events
	# belongs_to :creator, class_name: "User", foreign_key: "creator_id"
	belongs_to :creator, class_name: "User"
	has_many :posts, dependent: :destroy
	has_many :event_requests

	mount_uploader :image, AvatarUploader
	has_many :photos

  # 	validate :happened_at_is_valid_datetime

 	# def happened_at_is_valid_datetime
  #   	errors.add(:happened_at, 'must be a valid datetime') if ((DateTime.parse(happened_at) rescue ArgumentError) == ArgumentError)
 	# end

 	validates_date :start_date, :on_or_before => lambda { :end_date }

end
