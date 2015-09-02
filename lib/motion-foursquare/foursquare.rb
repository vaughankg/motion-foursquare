module Foursquare

  @default_options = {
    api_root:"https://api.foursquare.com/v2",
    api_version: '20140806',
    m_parameter: 'foursquare',
    client_id: "",
    client_secret: "",
  }

  def self.client(options = {})
    Client.new(options)
  end

  def self.set_default_options(options = {})
    options.each do |key, value|
      @default_options[key] = value
    end
  end

  def self.default_options
    @default_options
  end

end

