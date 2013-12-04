class DirectoryManager
  
  attr_reader :path, :mkv_list, :srt_list

  def initialize(path)
    @path = path
    @mkv_list = find_files(/.mkv/)
    @srt_list = find_files(/.srt/)
  end

  #private
  #should be private, not private for testing exercise :-)

  def self.find_files(file_type_pattern)
    list = []
    Dir.entries(path).each do |filename|      
      list << filename if (filename =~ file_type_pattern)
    end
    list
  end

end