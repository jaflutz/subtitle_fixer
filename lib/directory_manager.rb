require_relative 'title_matcher.rb'

class DirectoryManager
  
  attr_reader :path, :mkv_list, :srt_list

  def initialize(path)
    @path = path
    @mkv_list = find_files(/.mkv/)
    @srt_list = find_files(/.srt/)
  end

  def fix_subtitles    
    @mkv_list.each do |mkv_name| 
      @srt_list.each do |srt_name|
        if TitleMatcher.match? mkv_name, srt_name
          rename_file srt_name, mkv_name
          break
        end
      end  
    end
    
  end

  #private
  #should be private, not private for testing exercise :-)

  def find_files(file_type_pattern)
    list = []        
    Dir.entries(@path).each do |filename|
      list << filename if (filename =~ file_type_pattern)
    end
    list
  end

  def rename_file srt_name, mkv_name
    old_name = @path + srt_name
    new_name = @path + mkv_name.gsub!(".mkv", ".srt")
    File.rename(old_name, new_name) 
  end

end