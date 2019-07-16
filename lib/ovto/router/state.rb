module Ovto
  module Router
    module State
      def self.included(mod)
        mod.item :ovto_router, default: OvtoRouterState.new
      end
    end
  end
end
