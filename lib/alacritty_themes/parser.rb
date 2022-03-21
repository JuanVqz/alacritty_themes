require "optparse"

module AlacrittyThemes
  module Parser
    def self.from(argv)
      options = {}

      OptionParser.new do |op|
        options[:parser] = op
        op.banner = "Usage: alacritty_themes [options]"

        op.on("-c", "--create", "Creates file") do
          options[:command] = :create
          options[:message] = "Creating Alacritty file"
        end

        op.on("-v", "--version", "Shows version") do
          options[:command] = :version
          options[:message] = "Alacritty Themes v#{AlacrittyThemes::VERSION}"
        end

        op.on("-h", "--help", "Shows help") do
          options[:command] = :help
          options[:message] = op.help
        end
      end.parse!(argv)

      options
    rescue OptionParser::ParseError => e
      { command: :error, message: e.message }
    end
  end
end
