RSpec.describe "`github_rb fetch_user` command", type: :cli do
  it "executes `github_rb help fetch_user` command successfully" do
    output = `github_rb help fetch_user`
    expected_output = <<-OUT
Usage:
  github_rb fetch_user USERNAME

Options:
  -h, [--help], [--no-help]  # Display usage information

Get user detail
    OUT

    expect(output).to eq(expected_output)
  end
end
