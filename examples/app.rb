require 'ovto'
require 'ovto/router'

class App < Ovto::App
  class State < Ovto::State
    include Ovto::Router::Mixin::State
  end

  class Actions < Ovto::Actions
    include Ovto::Router::Mixin::Actions
  end

  class MainComponent < Ovto::Component
    def render
      o 'div' do
        o Ovto::Router::HashRouter, routes: {
          "/": -> { o 'h1', 'Top' },
          "/hello": -> { o 'h1', 'Hello' },
          "/bye": -> { o 'h1', 'Bye' },
        }

        o Ovto::Router::Link, path: '#/hello', text: "Hello"
        o 'br'
        o Ovto::Router::Link, path: '#/bye', text: "Bye"
        o 'br'
        o Ovto::Router::Link, path: '#/', text: "root"
      end
    end
  end
end


App.run(id: 'ovto')
