def foursquare_test_client
  Foursquare.client
end

def parse_json_fixture(fixture_path)
  file_content = File.read(ENV["fixtures_path"] + fixture_path)
  data = file_content.dataUsingEncoding(NSUTF8StringEncoding)
  e = Pointer.new(:object)
  json = NSJSONSerialization.JSONObjectWithData(data, options:0, error: e)
  json
end

def default_error_callback
  { failure: Proc.new { |err| mp err; resume } }
end

module Foursquare
  class Client
    def encode_url(end_point, params = {})
      all_params = params.merge!(self.api_params)
      "#{self.api_root}/#{end_point}?#{URI.encode_www_form(all_params)}"
    end
  end
end

