# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/responders/all/responders.rbi
#
# responders-0.6.5
module Responders
end
module Responders::ControllerMethod
  def responders(*responders); end
end
class ActionController::Base < ActionController::Metal
  extend Responders::ControllerMethod
end
class Responders::Railtie < Rails::Railtie
end
