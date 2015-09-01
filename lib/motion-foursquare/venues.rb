module FourSquare
  module Venues

    # Suggest venue completions. Returns a list of mini-venues partially matching the search term, near the location.
    #
    # @param [Hash]  params
    # @option params String :ll - Latitude and longitude in format LAT,LON
    # @option params Integer :llAcc - Accuracy of the lat/lon in meters.
    # @option params Integer :alt - Altitude in meters
    # @option params Integer :altAcc - Accuracy of the altitude in meters
    # @option params String :query - Query to match venues on.
    # @option params Integer :limit - The limit of results to return.

    def venues_suggestcompletion(params = {}, &block)
      request(:get, "venues/suggestcompletion", params, &block)
    end

  end
end

