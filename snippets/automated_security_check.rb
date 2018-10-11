#require 'open3'

describe "Securitah!" do
  it "Brakeman passes" do
    stdout, stderr, status = Open3.capture3 'bundle exec brakeman -z -w1'
    expect(status.success?).to eq(true), stdout
  end

  it "Bundler Audit passes" do
    stdout, stderr, status = Open3.capture3 'bundler-audit check --update --quiet'
    expect(status.success?).to eq(true), stdout
  end
end
