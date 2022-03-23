# frozen_string_literal: true

RSpec.describe AlacrittyThemes::CLI do
  describe ".start" do
    let(:cli) { AlacrittyThemes::CLI.new }

    context "with create option" do
      it "creates the alacritty file" do
        path = File.join(Dir.home, ".config/alacritty/alacritty.yml")
        FileUtils.rm(path) if File.exist?(path)

        expect { cli.start(["-c"]) }.to change { File.exist?(path) }.from(false).to(true)
      end

      it "creates the alacritty directory path" do
        path = File.dirname(File.join(Dir.home, ".config/alacritty/alacritty.yml"))
        FileUtils.rm_r(path) if File.exist?(path)

        expect { cli.start(["-c"]) }.to change { File.exist?(path) }.from(false).to(true)
      end
    end

    context "with version option" do
      it "prints the version" do
        expected = "Alacritty Themes v#{AlacrittyThemes::VERSION}\n"

        expect { cli.start(["-v"]) }.to output(expected).to_stdout
      end
    end

    context "with help option" do
      it "prints the help banner" do
        expected = /Usage: alacritty_themes \[options\]/

        expect { cli.start(["-h"]) }.to output(expected).to_stdout
      end
    end

    context "with invalid option" do
      it "exits with error message" do
        expected = /invalid option: --invalid-option/

        expect { cli.start(["--invalid-option"]) }.to output(expected).to_stdout
      end
    end
  end
end
