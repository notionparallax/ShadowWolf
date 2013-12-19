require 'spec_helper'

describe Person do
  describe 'conditions' do
  	it 'should not allow two conditions with the same start date' do
      person = FactoryGirl.create :person, condtion: []
      2.times { person.condtions << Condition.new name: 'Active', start_date: 0.day.ago }
      person.save.should eq(false)
  	end
  end
end

