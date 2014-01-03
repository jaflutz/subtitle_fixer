require_relative './lib/directory_manager.rb'

directory_manager = DirectoryManager.new(ARGV[0])
directory_manager.fix_subtitles