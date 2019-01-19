# frozen_string_literal: true

require_relative '../command'
require 'tty-config'

module GithubRb
  module Commands
    class Config < GithubRb::Command
      def initialize(github_api_key, options)
        @github_api_key = github_api_key
        @options = options

        @config = TTY::Config.new
        @config.filename = 'github_rb'
        @config.extname = '.yml'

        # Specify the directory for TTY::Config to look for a config file.
        @config.append_path Dir.pwd
      end

      def execute(input: $stdin, output: $stdout)
        @config.read if @config.persisted?
        @config.set('GITHUB_API_KEY', value: @github_api_key)
        @config.write(force: true)
        output.puts 'Config updated!'
      end
    end
  end
end
