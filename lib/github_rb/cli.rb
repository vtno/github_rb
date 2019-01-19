# frozen_string_literal: true

require 'thor'

module GithubRb
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'github_rb version'
    def version
      require_relative 'version'
      puts "v#{GithubRb::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'config GITHUB_API_KEY', 'Add GitHub api key to the configuration'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def config(github_api_key)
      if options[:help]
        invoke :help, ['config']
      else
        require_relative 'commands/config'
        GithubRb::Commands::Config.new(github_api_key, options).execute
      end
    end
  end
end
