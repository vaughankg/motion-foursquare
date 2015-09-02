describe "Venues" do
  extend WebStub::SpecHelpers

  context "When using the foursquare API and working with venues" do
    before do
      AFNetworkActivityLogger.sharedLogger.startLogging
      disable_network_access!
      @client = foursquare_test_client
    end

    after do
      enable_network_access!
    end

    it "should fetch info for a single venue" do

      venue_id = "4b8c3d87f964a520f7c532e3"

      stub_request(:get, @client.encode_url("venues/#{venue_id}")).
        to_return(json: parse_json_fixture("/venues/venue.json"))

      @client.venue(venue_id, {}, default_error_callback) do |venue|
        @venue = venue
        resume
      end

      wait do
        @venue["name"].should == 'Bridgestone Arena'
        @venue["location"]["address"].should == '501 Broadway'
      end
    end

    it "should suggest venues based on passed criteria" do

      params = { ll: "40.7,-74", query: "coffee" }

      stub_request(:get, @client.encode_url("venues/suggestcompletion", params)).
        to_return(json: parse_json_fixture("/venues/suggest_completion_venues.json"))

      @client.suggest_completion_venues(params, default_error_callback) do |result|
        @minivenues = result
        resume
      end

      wait_max 1.0 do
        @minivenues.first["id"].should == '44dc96e4f964a520b0361fe3'
      end
    end
  end
end

