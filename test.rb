require 'interfax'
Interfax::Base.username = 'aidin'
Interfax::Base.password = 'ENCRYPTPASSWORDS'

x = Interfax::Inbound.index
puts x
puts x.first
x.first.read!
puts x.first