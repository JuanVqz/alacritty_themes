# frozen_string_literal: true

require "fileutils"

module AlacrittyThemes
  module FileHelper # :nodoc:
    def create_file
      FileUtils.touch(file_path)
    end

    def create_directory_path
      FileUtils.mkdir_p(directory_path)
    end

    def create_backup_file
      FileUtils.mv(file_path, "#{file_path}.bak")
    end

    def does_file_exist?
      File.exist?(file_path)
    end

    def does_path_exist?
      File.directory?(directory_path)
    end

    def file_path
      File.join(Dir.home, ".config/alacritty/alacritty.yml")
    end

    def directory_path
      File.dirname(file_path)
    end
  end
end
