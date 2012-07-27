$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'interfax/api'
require 'interfax/base'
require 'interfax/fax'
require 'interfax/inbound'