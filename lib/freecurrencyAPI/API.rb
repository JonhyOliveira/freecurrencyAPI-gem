# frozen_string_literal: true
require 'faraday'

module FreeCurrencyAPI

    class API
        def initialize api_key
            @conn = Faraday.new "https://api.freecurrencyapi.com/v1/" do |c|
            c.response :json
            c.adapter :net_http
            c.headers = {apikey: "#{api_key}"}
            end
        end

        def latest_exchange_rates
            do_request "latest"
        end

        def available_currencies
            do_request "currencies"
        end

        private
        #
        # Makes a request to an endpoint and returns the result
        #
        # @param [String] endpoint the string describing the endpoint
        #
        # @return [Hash|String] the result of the request, if successfull will return an hash 
        # describing the returned data, otherwise returns a message specifying what went wrong
        #
        def do_request endpoint
            resp = @conn.get endpoint

            if resp.success?
                return resp.body["data"]
            else
                return resp.body["message"]
            end
        end
    end
end
