require 'spec_helper'
require 'title_matcher'

describe "TitleMatcher" do
  let (:upper_title) { "Person.of.Interest.S03E10.720p.HDTV.X264-DIMENSION" }
  let (:down_title) { "Person.of.Interest.s03e10.720p.HDTV.X264-DIMENSION" }
  let (:different_title_same_episode) { "PersonofInterest.S03E10.720p.HDTV.X264-DIMENSION" }
  let (:same_title_different_episode) { "Person.of.Interest.S03E11.720p.HDTV.X264-DIMENSION" }
  let (:same_title_different_season) { "Person.of.Interest.S04E10.720p.HDTV.X264-DIMENSION" }

  it "matches similar titles from mkv and srt" do
    expect(TitleMatcher.match?(upper_title, down_title)).to be_true
  end


  it "doesn't match titles from different episodes" do
    expect(TitleMatcher.match?(upper_title, same_title_different_episode)).to be_false
  end
end
