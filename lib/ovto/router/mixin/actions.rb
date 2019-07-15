module Ovto
  module Router
    module Mixin
      module Actions
        HISTORY = Native(`history`)

        def ovto_router_handle_update_path(path:)
          return { ovto_router: OvtoRouterState.new(path: path) }
        end

        def ovto_router_handle_click_link(path:)
          HISTORY.pushState(nil, "", path)
          return { ovto_router: OvtoRouterState.new(path: path) }
        end
      end
    end
  end
end
