# frozen_string_literal: true

RSpec.describe AlacrittyThemes::CLI do
  describe ".start" do
    let(:cli) { AlacrittyThemes::CLI.new }

    context "when create option" do
      it "creates the alacritty file" do
        path = alacritty_file_path

        expect { cli.start(["-c"]) }.to change { File.exist?(path) }.from(false).to(true)
      end

      it "creates the alacritty directory path" do
        path = alacritty_file_path
        directory = File.dirname(path)

        expect { cli.start(["-c"]) }.to change { File.directory?(directory) }.from(false).to(true)
      end

      context "when the alacritty file already exists" do
        it "creates a backup" do
          create_alacritty_file
          path = alacritty_backup_file_path

          expect { cli.start(["-c"]) }.to change { File.exist?(path) }.from(false).to(true)
        end

        it "keeps both files" do
          existing_file = create_alacritty_file
          backup_file = alacritty_backup_file_path

          cli.start(["--create"])

          expect(File).to exist(existing_file)
          expect(File).to exist(backup_file)
        end
      end
    end

    context "with version option" do
      it "prints the version" do
        output = "Alacritty Themes v#{AlacrittyThemes::VERSION}\n"

        expect { cli.start(["-v"]) }.to output(output).to_stdout
      end
    end

    context "with help option" do
      it "prints the help banner" do
        output = /Usage: alacritty_themes \[options\]/

        expect { cli.start(["-h"]) }.to output(output).to_stdout
      end
    end

    context "with invalid option" do
      it "exits with error message" do
        output = /invalid option: --invalid-option/

        expect { cli.start(["--invalid-option"]) }.to output(output).to_stdout
      end
    end
  end

  def create_alacritty_file
    path = alacritty_file_path
    FileUtils.mkdir_p(path)
    FileUtils.touch(path)

    path
  end

  def alacritty_file_path
    default_alacritty_path "alacritty.yml"
  end

  def alacritty_backup_file_path
    default_alacritty_path "alacritty.yml.bak"
  end

  def default_alacritty_path(file_name)
    File.join(Dir.home, ".config/alacritty/#{file_name}")
  end
end
