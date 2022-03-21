# frozen_string_literal: true

RSpec.describe AlacrittyThemes::Parser do
  context "with valid options" do
    it "returns an instance of OptionParser" do
      input = []

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:parser]).to be_a(OptionParser)
    end

    it "returns :create command" do
      input = ["--create"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:command]).to eq(:create)
      expect(options[:message]).to eq "Creating Alacritty file"
    end

    it "returns :version command" do
      input = ["--version"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:command]).to eq :version
      expect(options[:message]).to eq "Alacritty Themes v#{AlacrittyThemes::VERSION}"
    end

    it "returns :help command" do
      input = ["--help"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:command]).to eq :help
      expect(options[:message]).to include "Usage: alacritty_themes [options]"
    end
  end

  context "with invalid options" do
    it "returns :error command" do
      input = ["--non-existent-command"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:command]).to eq :error
      expect(options[:message]).to eq "invalid option: --non-existent-command"
    end
  end
end
