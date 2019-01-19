# frozen_string_literal: true

require_relative '../command'

module GithubRb
  module Commands
    class Config < GithubRb::Command
      def initialize(github_api_key, options)
        @github_api_key = github_api_key
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts "OK"
      end
    end
  end
end
