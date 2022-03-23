# frozen_string_literal: true

require "fileutils"
require "alacritty_themes/version"
require_relative "alacritty_themes/parser"

module AlacrittyThemes
  class Error < StandardError; end

  # CLI entry point
  class CLI
    def start(argv)
      options = parse_options(argv)
      execute_command(options)
    end

    private

    def parse_options(argv)
      Parser.from(argv)
    end

    def execute_command(options)
      if options[:command] == :create
        file_path = File.join(Dir.home, ".config/alacritty/alacritty.yml")
        directory_path = File.dirname(file_path)

        FileUtils.mkdir_p(directory_path) unless File.directory?(directory_path)
        FileUtils.touch(file_path)
      end
      puts options[:message]
    end
  end
end
