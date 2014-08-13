require 'spec_helper'

describe TypeaheadResultsController do

  describe "GET 'fetch'" do
    #docker run --rm -t --link sw-mongo:mongo -v `pwd`:/ShadowWolf -w /ShadowWolf/server shadowwolf-dev bundle exec rspec spec/controllers/typeahead_results_controller_spec.rb --color
    let(:nine_thousand_and_one) { 9001 }
    let(:weasley_twins) do
      [['fred','Active'],['george','Maternity']].map do |name,condition|
        {
          name: { first: name },
          conditions: [{name: condition}]
        }
      end
    end

    let(:sydney_buildings) do
      ['that big tower','that big bridge',
       'that funky looking thing by the harbor'].map do |building_name|
        {
          building:
          {
            locations: [{ addresses: [{building_name: building_name}]}]
          }
        }
      end
    end

    after do
      Person.destroy_all
      Project.destroy_all
    end

    let (:over_9000_buildings) do
      nine_thousand_and_one.times.collect do |i|
        {
          building:
          {
            locations: [{ addresses: [{building_name: "Building #%04d" % i}]}]
          }
        }
      end
    end

    it "returns ['fred','george'] when lens = 'person.name.first'" do
      Person.collection.insert weasley_twins
      get :fetch, format: :json, lens: 'name.first', class_name: 'person'
      response.body.should eq({ possibilities: ['fred','george'] }.to_json)
    end

    it "plural properties (conditions.name)" do 
      Person.collection.insert weasley_twins
      get :fetch, format: :json, lens: 'conditions.name', class_name: 'person'
      response.body.should eq({ possibilities: ['Active','Maternity'] }.to_json)
    end

    it "plural properties with id (conditions[blahblah].name)" do
      Person.collection.insert weasley_twins
      get :fetch, format: :json, lens: 'conditions[blahblah].name', class_name: 'person'
      response.body.should eq({ possibilities: ['Active','Maternity'] }.to_json)
    end

    it "plural props on plural parent objects" do
      Project.collection.insert sydney_buildings
      get :fetch, format: :json, lens: 'building.locations.addresses.building_name', class_name: 'project'
      response.body.should eq({ possibilities:
        ['that big tower','that big bridge','that funky looking thing by the harbor']
      }.to_json)
    end

    it "a lot of objects" do
      Project.collection.insert over_9000_buildings
      get :fetch, format: :json, lens: 'building.locations.addresses.building_name', class_name: 'project'
      JSON.parse(response.body)['possibilities'].sort.should eq( nine_thousand_and_one.times.collect { |i| "Building #%04d" % i })
    end

    it "should still spit out an array even when there's only one result" do
      Person.collection.insert weasley_twins[0]
      get :fetch, format: :json, lens: 'name.first', class_name: 'person'
      response.body.should eq({ possibilities: ['fred'] }.to_json)
    end

    it "should respond with 403 when no class_name or lens is provided" do
      get :fetch, format: :json, lens: nil
      response.status.should eq(403)
    end

  end
end
