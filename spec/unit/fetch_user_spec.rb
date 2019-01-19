require 'github_rb/commands/fetch_user'

RSpec.describe GithubRb::Commands::FetchUser do
  it "executes `fetch_user` command successfully" do
    output = StringIO.new
    username = nil
    options = {}
    command = GithubRb::Commands::FetchUser.new(username, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
