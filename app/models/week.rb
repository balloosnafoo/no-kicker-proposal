class Week < ActiveRecord::Base
  def self.matchups
    Matchup.where(week: Week.first.current_week)
  end
end