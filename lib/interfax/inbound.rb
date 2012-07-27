module Interfax
  class Inbound < Interfax::Base
    class << self
      attr_accessor :unreadOnly, :limit, :offset, :allUsers, :lastId
      def initialize
        @unreadOnly = false
        @limit = 25
        @lastId = -1
        @allUsers = false
      end

      def index unreadOnly = @unreadOnly, limit = @limit, lastId = @lastId, allUsers = @allUsers
        response = self.get Api::Inbound::Index, { :unreadOnly => unreadOnly, :limit => limit, :offset => offset, :allUsers => allUsers, :lastId => lastId }
      end
    end
  end
end