# frozen_string_literal: true

RSpec.describe AlacrittyThemes::Parser do
  context "without input" do
    it "returns an instance of OptionParser" do
      input = []

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:parser]).to be_a(OptionParser)
    end
  end

  context "when the input is create" do
    it "returns :create command" do
      input = ["--create"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:command]).to eq(:create)
    end

    it "returns a message" do
      input = ["-c"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:message]).to eq "alacritty.yml was created"
    end
  end

  context "when the input is version" do
    it "returns :version command" do
      input = ["--version"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:command]).to eq :version
    end

    it "returns a message" do
      input = ["-v"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:message]).to eq "Alacritty Themes v#{AlacrittyThemes::VERSION}"
    end
  end

  context "when the input is help" do
    it "returns :help command" do
      input = ["--help"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:command]).to eq :help
    end

    it "returns a message" do
      input = ["-h"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:message]).to include "Usage: alacritty_themes [options]"
    end
  end

  context "with invalid input" do
    it "returns :error command" do
      input = ["--non-existent-command"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:command]).to eq :error
    end

    it "returns a message" do
      input = ["--non-existent-command"]

      options = AlacrittyThemes::Parser.from(input)

      expect(options[:message]).to eq "invalid option: --non-existent-command"
    end
  end
end
