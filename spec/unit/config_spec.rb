require 'github_rb/commands/config'

RSpec.describe GithubRb::Commands::Config do
  it "executes `config` command successfully" do
    output = StringIO.new
    github_api_key = nil
    options = {}
    command = GithubRb::Commands::Config.new(github_api_key, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
