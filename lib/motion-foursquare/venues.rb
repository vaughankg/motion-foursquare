module Foursquare
  module Venues

    # Retrieve information about a venue
    #
    # param [String] venue_id The ID of the venue

    def venue(venue_id, params = {}, callbacks = {}, &block)
      request(:get, "venues/#{venue_id}", params, callbacks) do |response|
        block.call(response["venue"])
      end
    end

    # Suggest venue completions. Returns a list of mini-venues partially matching the search term, near the location.
    #
    # @param [Hash]  params
    # @option params String :ll - Latitude and longitude in format LAT,LON
    # @option params Integer :llAcc - Accuracy of the lat/lon in meters.
    # @option params Integer :alt - Altitude in meters
    # @option params Integer :altAcc - Accuracy of the altitude in meters
    # @option params String :query - Query to match venues on.
    # @option params Integer :limit - The limit of results to return.

    def suggest_completion_venues(params, callbacks = {}, &block)
      return unless params[:query].length > 2
      request(:get, "venues/suggestcompletion", params, callbacks) do |response|
        block.call(response["minivenues"])
      end
    end
  end

end
