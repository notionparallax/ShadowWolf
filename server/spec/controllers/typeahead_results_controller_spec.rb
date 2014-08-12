require 'spec_helper'

describe TypeaheadResultsController do

  describe "GET 'fetch'" do
    #docker run --rm -t --link sw-mongo:mongo -v `pwd`:/ShadowWolf -w /ShadowWolf/server shadowwolf-dev bundle exec rspec spec/controllers/typeahead_results_controller_spec.rb --color
    it "return [] when lens is nil" do
      get :fetch, format: :json
      response.body.should eq({ possibilities: []}.to_json)
    end

    let(:weasley_twins) do
      [['fred','Active'],['george','Maternity']].map do |name,condition|
        pn = PersonName.new ; pn.first = name;
        c = Condition.new name: condition
        Person.new name: pn, conditions: [c]
      end
    end

    let(:sydney_buildings) do
      ['that big tower','that big bridge',
       'that funky looking thing by the harbor'].map do |building_name|
        a = Address.new building_name: building_name
        loc = Location.new addresses: [a]
        leg = Legacy.new locations: [loc]
        b = Building.new legacy: leg
        Project.new building: b
      end
    end

    let (:over_9000_buildings) do
      9001.times.collect do |i|
        a = Address.new building_name: 'Building #' + i.to_s
        loc = Location.new addresses: [a]
        leg = Legacy.new locations: [loc]
        b = Building.new legacy: leg
        Project.new building: b
      end
    end

    it "returns ['fred','george'] when lens = 'person.name.first'" do
      Person.stub(:all).and_return(weasley_twins)
      get :fetch, format: :json, lens: 'person.name.first'
      response.body.should eq({ possibilities: ['fred','george'] }.to_json)
    end

    it "should work on plural properties (conditions.name)" do 
      Person.stub(:all).and_return(weasley_twins)
      get :fetch, format: :json, lens: 'person.conditions.name'
      response.body.should eq({ possibilities: ['Active','Maternity'] }.to_json)
    end

    it "should work on plural properties with id (conditions[blahblah].name)" do
      Person.stub(:all).and_return(weasley_twins)
      get :fetch, format: :json, lens: 'person.conditions[blahblah].name'
      response.body.should eq({ possibilities: ['Active','Maternity'] }.to_json)
    end

    it "should work on plural props on plural parent objects" do
      Project.stub(:all).and_return(sydney_buildings)
      get :fetch, format: :json, lens: 'project.building.locations.addressess.building_name'
      response.body.should eq({ possibilities:
        ['that big tower','that big bridge','that funky looking thing by the harbor']
      }.to_json)
    end

    it "should work on a lot of objects" do
      Project.stub(:all).and_return(over_9000_buildings)
      get :fetch, format: :json, lens: 'project.building.locations.addressess.building_name'
      response.body.should eq({ possibilities:
        9001.times.collect { |i| 'Building #' + i.to_s }
      }.to_json)
    end

    it "should still spit out an array even when there's only one result" do
      Person.stub(:all).and_return([weasley_twins[0]])
      get :fetch, format: :json, lens: 'person.name.first'
      response.body.should eq({ possibilities: ['fred'] }.to_json)
    end

    it "should complain when the final segment of the lens is not a property" do
      get :fetch, format: :json, lens: 'person.name'
      expect([response.status,response.body]).to eq(403, 'Lens does not end in a property')
    end

    it "should complain when any part of the lens is not a valid relation" do
      get :fetch, format: :json, lens: 'person.dog'
      expect([response.status,response.body]).to eq([403, 'Lens contains invalid property or subobject: dog'])
    end

  end
end
