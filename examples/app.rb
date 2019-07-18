require 'ovto'
require 'ovto/router'

class MyApp < Ovto::App
  class State < Ovto::State
    include Ovto::Router::State
  end

  class Actions < Ovto::Actions
    include Ovto::Router::Actions
  end

  class MainComponent < Ovto::Component
    def render
      o 'div' do
        o Ovto::Router::HashRouter, routes: {
          "/": -> { o 'h1', 'Root' },
          "/hello": -> (name:) { o 'h2', "Hello, #{name}" },
          "/bye": -> { o 'h2', "Bye" },
        }

        o Ovto::Router::Link, path: '#/', text: 'go to root'
        o 'br'
        o Ovto::Router::Link, path: '#/hello?name=Pocke', text: 'go to hello'
        o 'br'
        o Ovto::Router::Link, path: '#/bye', text: 'go to bye'
      end
    end
  end
end

MyApp.run(id: 'ovto')
