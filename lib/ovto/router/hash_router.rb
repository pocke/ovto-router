require 'native'

module Ovto
  module Router
    class HashRouter < Ovto::Component
      # @example
      #   o HashRouter, routes: {
      #     "/foo": -> { o FooComponent },
      #     "/foo/:id": -> (id:) { o FooComponent, id: id },
      #   }
      def render(routes:)
        o 'div', { oncreate: -> { actions.ovto_router_handle_update_path(path: current_path) } } do
          routes.each do |matcher, renderer|
            if matcher == state.ovto_router_path
              renderer.call
              break
            end
          end
        end
      end

      private def current_path
        Native(`location.hash`)[1..-1]
      end
    end
  end
end
