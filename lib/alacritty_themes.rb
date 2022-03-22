# frozen_string_literal: true

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
      puts options[:message]
    end
  end
end
