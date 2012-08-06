module Interfax
  module Api
    SOAP_WSDL = 'https://ws.interfax.net/inbound.asmx?WSDL'

    module MethodMissing
      def method_missing meth, *args, &block
        if defined?const_get(meth.to_s.capitalize)
          const_get(meth.to_s.capitalize).gsub ':id', args.first.to_s
        else
          super
        end
      end
    end

    class Inbound
      self.extend MethodMissing
      Index = 'rest.interfax.net/inbound/faxes'
      Show = 'rest.interfax.net/inbound/faxes/:id'
      Image = 'rest-pilot.interfax.net/inbound/faxes/:id/image'
      Mark = 'rest.interfax.net/inbound/faxes/:id/mark?unread=:flag'

      def self.mark id, flag
        puts "Id => " + id.to_s
        puts "Flag => " + flag.to_s
        url = const_get(:mark.to_s.capitalize).gsub ":id", id.to_s
        url = url.gsub ":flag", flag.to_s
        puts url
        url
      end
    end
  end
end