require 'spec_helper'

describe Condition do
  describe 'Name' do
    it 'should only allow permissable names' do
      permissable_names = ['Active', 'Retired', 'Maternity', 'Leave', 'Deceased', 'Applicant', 'Left', 'Unknown']
      example_non_permissable_names = ['Dickhead', 'stable', 'firm']
      
      permissable_names.each do |name|
        person = FactoryGirl.create :person, conditions: []
        person.conditions << Condition.new( name: name, start_date: 1.day.ago )
        person.save.should eq(true)
      end

      example_non_permissable_names.each do |name|
        person = FactoryGirl.create :person, conditions: []
        person.conditions << Condition.new( name: name, start_date: 1.day.ago )
        person.save.should eq(false)
      end
    end

  	it 'should not allow two conditions with the same start date' do
      person = FactoryGirl.create :person, conditions: []
      2.times { person.conditions << Condition.new( name: 'Active', start_date: 0.day.ago ) }
      person.save.should eq(false)
  	end
  end
end
