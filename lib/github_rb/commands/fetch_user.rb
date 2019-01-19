# frozen_string_literal: true

require_relative '../command'

module GithubRb
  module Commands
    class FetchUser < GithubRb::Command
      def initialize(username, options)
        @username = username
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts "OK"
      end
    end
  end
end
