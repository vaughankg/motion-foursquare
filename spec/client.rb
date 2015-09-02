describe "Client" do
  extend WebStub::SpecHelpers
  before do
    AFNetworkActivityLogger.sharedLogger.startLogging
    disable_network_access!
    @client = foursquare_test_client
  end

  after do
    enable_network_access!
  end

  it "should respond_to" do
    @client.respond_to?(:api_root).should == true
    @client.respond_to?(:client_id).should == true
    @client.respond_to?(:client_secret).should == true
    @client.respond_to?(:api_version).should == true
    @client.respond_to?(:m_parameter).should == true

    @client.respond_to?(:api_params).should == true
  end

  # A test only method used along with webstub to stub afmotion requests
  describe "#encode_url" do
    it "should create a url" do
      @client.encode_url("", {}).should != nil
    end

    it "should stub" do
      params = { query: "asd", ll: "41,31" }
      stub_request(:get, @client.encode_url("", params)).to_return(json: { response: { "hello" => "world" } })

      @client.request(:get, "", params) do |results|
        @results = results
        resume
      end

      wait { @results.should == { "hello" => "world" } }
    end
  end
end

