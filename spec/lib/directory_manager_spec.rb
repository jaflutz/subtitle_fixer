require 'spec_helper'
require 'directory_manager'

describe "DirectoryManager" do

  let(:directory_content) { ["teste.mkv", "teste2.srt", "teste3.mkv"] }

  it "reads the correct files of a specified filetype" do
    directory_manager = DirectoryManager.new("./")
    directory_manager.stub(:path).and_return("anything")
    Dir.stub(:entries).with(anything()).and_return(directory_content)
    expect(directory_manager.find_files(/.mkv/)).to eq(["teste.mkv", "teste3.mkv"])
  end

end