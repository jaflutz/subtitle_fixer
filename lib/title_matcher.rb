class TitleMatcher
  def self.match?(mkv, srt)
    season_pattern = /[sS]\d\d/
    episode_pattern = /[eE]\d\d/

    mkv_season =  mkv.match(season_pattern).to_s
    srt_season = srt.match(season_pattern).to_s
    mkv_episode = mkv.match(episode_pattern).to_s
    srt_episode = srt.match(episode_pattern).to_s    

    (same_episode?(mkv_episode, srt_episode) and 
      same_season?(mkv_season, srt_season))
  end

  private

  def self.same_episode?(episode1, episode2)
    episode1[1,2].eql? episode2[1,2]
  end

  def self.same_season?(season1, season2)
    season1[1,2].eql? season2[1,2]
  end
end