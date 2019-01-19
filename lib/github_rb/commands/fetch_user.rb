# frozen_string_literal: true

require_relative '../command'
require 'tty-spinner'
require 'tty-table'
require 'net/http'
require 'json'

module GithubRb
  module Commands
    BASE_URL = 'https://api.github.com'
    ENDPOINT = 'users'

    HEADERS = [
      'name', 'company', 'blog',
      'location', 'email', 'hireable',
      'bio', 'public_repos', 'public_gists',
      'followers', 'following', 'login'
    ].freeze

    TABLE_OPTIONS = {
      padding: [0, 1, 0, 1],
      multiline: true
    }

    class FetchUser < GithubRb::Command
      def initialize(username, options)
        @username = username
        @options = options
        @spinner = TTY::Spinner.new
      end

      def execute(input: $stdin, output: $stdout)
        @spinner.auto_spin
        resp = fetch_user
        @spinner.stop('User fetched!')
        user_detail = JSON.parse resp.body
        output.puts(render_table(user_detail))
      end

      private

      def render_table(user_detail)
        details = user_detail.slice(*HEADERS).values
        TTY::Table.new(HEADERS, [details]).render(:ascii, **TABLE_OPTIONS)
      end

      def fetch_user
        url = File.join(BASE_URL ,ENDPOINT, @username)
        uri = URI.parse url
        http = Net::HTTP.new uri.host, uri.port
        request = Net::HTTP::Get.new uri.request_uri
        request['Accept'] = 'application/vnd.github.v3+json'
        http.use_ssl = true
        http.request(request)
      end
    end
  end
end
