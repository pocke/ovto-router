module Ovto
  module Router
    class HashRouter < Ovto::Component
      # @example
      #   o HashRouter, routes: {
      #     "/foo": -> { o FooComponent },
      #     "/foo/:id": -> (id:) { o FooComponent, id: id },
      #   }
      def render(routes:)
        o 'div', { oncreate: -> { on_create } } do
          routes.each do |matcher, renderer|
            if trim_hash(matcher) == trim_hash(state.ovto_router.path)
              renderer.call
              break
            end
          end
        end
      end

      private def trim_hash(path)
        if path.start_with?('#')
          path[1..-1]
        else
          path
        end
      end

      private def current_path
        Native(`location.hash`)
      end

      private def on_create
        actions.ovto_router_handle_update_path(path: current_path)
        %x!
          window.addEventListener('popstate', function (event) {
            event.preventDefault();
            #{actions.ovto_router_handle_update_path(path: current_path)}
          });
        !
      end
    end
  end
end
