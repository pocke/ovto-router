module Ovto
  module Router
    module Mixin
      module State
        def self.included(mod)
          mod.item :ovto_router, default: OvtoRouterState.new
        end
      end
    end
  end
end
