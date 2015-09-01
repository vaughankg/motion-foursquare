class FourSquare

  API_ROOT = "https://api.foursquare.com/v2/"
  API_VERSION = '20140806'
  M_PARAMETER = 'foursquare'

  CLIENT_ID = ""
  CLIENT_SECRET = ""

  def self.client(options = {})
    Client.new(default_options.merge(options))
  end

  def self.default_options
    {
      api_root: API_ROOT,
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      api_version: API_VERSION,
      m_parameter: M_PARAMETER
    }
  end

end

