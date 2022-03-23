# frozen_string_literal: true

require "optparse"

module AlacrittyThemes
  # Arguments parser
  module Parser
    class << self
      def from(argv)
        options = {}

        options[:parser] = parser
        add_banner
        add_create_option(options)
        add_version_option(options)
        add_help_option(options)
        parser.parse!(argv)

        options
      rescue OptionParser::ParseError => e
        { command: :error, message: e.message }
      end

      def parser
        @parser ||= OptionParser.new
      end

      def add_create_option(options)
        parser.on("-c", "--create", "Creates file") do
          options[:command] = :create
          options[:message] = "alacritty.yml was created"
        end
      end

      def add_version_option(options)
        parser.on("-v", "--version", "Shows version") do
          options[:command] = :version
          options[:message] = "Alacritty Themes v#{AlacrittyThemes::VERSION}"
        end
      end

      def add_help_option(options)
        parser.on("-h", "--help", "Shows help") do
          options[:command] = :help
          options[:message] = parser.help
        end
      end

      def add_banner
        parser.banner = "Usage: alacritty_themes [options]"
      end
    end
  end
end
