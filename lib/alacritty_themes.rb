# frozen_string_literal: true

require "alacritty_themes/version"
require_relative "alacritty_themes/parser"
require_relative "alacritty_themes/file_helper"

module AlacrittyThemes
  class Error < StandardError; end

  class CLI # :nodoc:
    include FileHelper

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
        create_directory_path unless does_path_exist?
        create_backup_file if does_file_exist?
        create_file
      end
      puts options[:message]
    end
  end
end
