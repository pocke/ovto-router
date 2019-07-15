module Ovto
  module Router
    module Mixin
      module Actions
        def self.included(mod)
          def ovto_router_handle_update_path(path:)
            return { ovto_router_path: path }
          end
        end
      end
    end
  end
end
