module Ovto
  module Router
    module Mixin
      module State
        def self.included(mod)
          mod.item :ovto_router_path, default: '/'
        end
      end
    end
  end
end
