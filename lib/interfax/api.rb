module Interfax
  module Api
    module Inbound
      Index = '/inbound/faxes'
      Show = '/inbound/faxes/:id'
      def show id
        self.Show.gsub ':id', id.to_s
      end
    end
  end
end