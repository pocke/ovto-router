module Ovto
  module Router
    class Matcher
      def self.build(str)
        if str.include?(':')
          raise NotImplementedError
        else
          SimpleMatcher.new(str)
        end
      end
    end

    class SimpleMatcher < Matcher
      def initialize(str)
        @str = str
      end

      def match?(path)
        path, query = path.split('?', 2)

        return unless path == @str
        return {} unless query

        params(query)
      end

      def params(query)
        query.split('&').map { |kv| kv.split('=') }.to_h
      end
    end
  end
end
