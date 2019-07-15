module Ovto
  module Router
    class Link < Ovto::Component
      def render(to:, text:)
        o 'a', { href: '#' + to, onclick: click_handler(to: to) }, text
      end

      private def click_handler(to:)
        -> do
          actions.ovto_router_handle_click_link(to: to)
        end
      end
    end
  end
end
