require 'rest_client'
require 'savon'

module Interfax
  class Base
    class << self
      def username
        @@username
      end
      def username=val
        @@username = val
      end
      def password
        @@password
      end
      def password=val
        @@password = val
      end

      def get url, options = {}
        url = "https://#{@@username}:#{@@password}@#{url}"
        options[:accept] = :json
        RestClient.get url, options
      end

      def post url, options = {}
        url = "https://#{@@username}:#{@@password}@#{url}"
        options = {:accept => :json, :content_length => 0}
        puts url
        puts options
        RestClient.post url, options
      end

      def delete url, options = {}
        url = "https://#{@@username}:#{@@password}@#{url}"
        options[:accept] = :json
        RestClient.delete url, options
      end

      soap_client = Savon.client(Interfax::Api::SOAP_WSDL)
    end
  end
end