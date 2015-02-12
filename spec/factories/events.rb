FactoryGirl.define do
  factory :event do
    name "hiking"
	description "hike moutain"
	start_date "2015-02-10 19:06:50"
	end_date "2015-02-10 19:06:50"
	cost 1.5
	address "Griffith Park"
	city "Los Angeles"
	state "CA"
	zip "90012"
	attendees 1
  end

end
