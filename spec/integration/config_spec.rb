RSpec.describe "`github_rb config` command", type: :cli do
  it "executes `github_rb help config` command successfully" do
    output = `github_rb help config`
    expected_output = <<-OUT
Usage:
  github_rb config GITHUB_API_KEY

Options:
  -h, [--help], [--no-help]  # Display usage information

Add GitHub api key to the configuration
    OUT

    expect(output).to eq(expected_output)
  end
end
