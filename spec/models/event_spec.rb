require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  it "is invalid without a name" do 
  	event = FactoryGirl.build(:event, name: nil)
		expect(event).to be_invalid
  end

  it "should test association between users and events" do 
  	event = Event.create(name: "test")
  	event.user.create(name: "test")
  end

end
