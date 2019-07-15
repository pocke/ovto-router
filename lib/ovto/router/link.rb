module Ovto
  module Router
    class Link < Ovto::Component
      def render(path:, text:)
        o 'a', { href: path, onclick: click_handler(path: path) }, text
      end

      private def click_handler(path:)
        -> (e) do
          e.preventDefault()
          actions.ovto_router_handle_click_link(path: path)
        end
      end
    end
  end
end
