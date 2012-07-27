require 'rest_client'

module Interfax
  class Base
    class << self
      attr_accessor :username, :password

      def get url, options = {}
        options[:username] = @username
        options[:password] = @password
        RestClient.get url, options
      end

      def post url, options = {}
        options[:username] = @username
        options[:password] = @password
        RestClient.post url, options
      end

      def delete url, options = {}
        options[:username] = @username
        options[:password] = @password
        RestClient.delete url, options
      end
    end
  end
end