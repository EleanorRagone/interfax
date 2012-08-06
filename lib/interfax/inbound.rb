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
        response = JSON.parse(self.get Api::Inbound::Index, { :unreadOnly => unreadOnly, :limit => limit, :offset => offset, :allUsers => allUsers, :lastId => lastId })
        faxes = []
        response.each do |fax|
          faxes << Fax.new(fax)
        end
        faxes unless faxes.count == 0
      end

      def show id
        response = JSON.parse(self.get Api::Inbound.show id)
      end

      def image id
        response = JSON.parse(self.get Api::Inbound.image id)
      end

      def markRead id
        response = JSON.parse(self.post Api::Inbound.mark(id, false), {"content-length" => 0})
      end

      def markUnread id
        response = JSON.parse(self.post Api::Inbound.mark(id, true), {"content-length" => 0})
      end
    end
  end
end