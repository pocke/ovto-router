module Ovto
  module Router
    module Mixin
      module Actions
        HISTORY = Native(`history`)
        def ovto_router_handle_update_path(path:)
          return { ovto_router_path: path }
        end

        def ovto_router_handle_click_link(to:)
          HISTORY.pushState(nil, "", '#' + to)
        end
      end
    end
  end
end
