namespace :populate_stats do
  desc "Populates stats from moneypuck.com for a given year and type (e.g., 'teams')"
  task :from_moneypuck, [ :year, :type ] => :environment do |t, args|
    year = args[:year]
    type = args[:type]

    if year.nil? || type.nil?
      puts "Usage: rake populate_stats:from_moneypuck[year,type]"
      puts "Example: rake populate_stats:from_moneypuck[2015,teams]"
      exit 1
    end

    base_url = "https://moneypuck.com/moneypuck/playerData/seasonSummary"
    url = "#{base_url}/#{year}/regular/#{type}.csv"

    puts "Fetching data from: #{url}"

    require "open-uri"
    require "csv"

    season = Season.find_or_create_by!(year: year)

    csv_data = URI.open(url).read
    CSV.parse(csv_data, headers: true) do |row|
      if type == "teams"
        team = Team.find_or_create_by!(name: row["team"])

        TeamStat.create!(
          team_id: team.id,
          season_id: season.id,
          name: row["name"],
          position: row["position"],
          situation: row["situation"],
          games_played: row["gamesPlayed"],
          x_goals_percentage: row["xGoalsPercentage"],
          corsi_percentage: row["corsiPercentage"],
          fenwick_percentage: row["fenwickPercentage"],
          ice_time: row["iceTime"],
          x_on_goal_for: row["xOnGoalFor"],
          x_goals_for: row["xGoalsFor"],
          x_rebounds_for: row["xReboundsFor"],
          x_freeze_for: row["xFreezeFor"],
          x_play_stopped_for: row["xPlayStoppedFor"],
          x_play_continued_in_zone_for: row["xPlayContinuedInZoneFor"],
          x_play_continued_outside_zone_for: row["xPlayContinuedOutsideZoneFor"],
          flurry_adjusted_x_goals_for: row["flurryAdjustedxGoalsFor"],
          score_venue_adjusted_x_goals_for: row["scoreVenueAdjustedxGoalsFor"],
          flurry_score_venue_adjusted_x_goals_for: row["flurryScoreVenueAdjustedxGoalsFor"],
          shots_on_goal_for: row["shotsOnGoalFor"],
          missed_shots_for: row["missedShotsFor"],
          blocked_shot_attempts_for: row["blockedShotAttemptsFor"],
          shot_attempts_for: row["shotAttemptsFor"],
          goals_for: row["goalsFor"],
          rebounds_for: row["reboundsFor"],
          rebound_goals_for: row["reboundGoalsFor"],
          freeze_for: row["freezeFor"],
          play_stopped_for: row["playStoppedFor"],
          play_continued_in_zone_for: row["playContinuedInZoneFor"],
          play_continued_outside_zone_for: row["playContinuedOutsideZoneFor"],
          saved_shots_on_goal_for: row["savedShotsOnGoalFor"],
          saved_unblocked_shot_attempts_for: row["savedUnblockedShotAttemptsFor"],
          penalties_for: row["penaltiesFor"],
          penalty_minutes_for: row["penalityMinutesFor"],
          face_offs_won_for: row["faceOffsWonFor"],
          hits_for: row["hitsFor"],
          takeaways_for: row["takeawaysFor"],
          giveaways_for: row["giveawaysFor"],
          low_danger_shots_for: row["lowDangerShotsFor"],
          medium_danger_shots_for: row["mediumDangerShotsFor"],
          high_danger_shots_for: row["highDangerShotsFor"],
          low_danger_x_goals_for: row["lowDangerxGoalsFor"],
          medium_danger_x_goals_for: row["mediumDangerxGoalsFor"],
          high_danger_x_goals_for: row["highDangerxGoalsFor"],
          low_danger_goals_for: row["lowDangerGoalsFor"],
          medium_danger_goals_for: row["mediumDangerGoalsFor"],
          high_danger_goals_for: row["highDangerGoalsFor"],
          score_adjusted_shots_attempts_for: row["scoreAdjustedShotsAttemptsFor"],
          unblocked_shot_attempts_for: row["unblockedShotAttemptsFor"],
          score_adjusted_unblocked_shot_attempts_for: row["scoreAdjustedUnblockedShotAttemptsFor"],
          d_zone_giveaways_for: row["dZoneGiveawaysFor"],
          x_goals_from_x_rebounds_of_shots_for: row["xGoalsFromxReboundsOfShotsFor"],
          x_goals_from_actual_rebounds_of_shots_for: row["xGoalsFromActualReboundsOfShotsFor"],
          rebound_x_goals_for: row["reboundxGoalsFor"],
          total_shot_credit_for: row["totalShotCreditFor"],
          score_adjusted_total_shot_credit_for: row["scoreAdjustedTotalShotCreditFor"],
          score_flurry_adjusted_total_shot_credit_for: row["scoreFlurryAdjustedTotalShotCreditFor"],
          x_on_goal_against: row["xOnGoalAgainst"],
          x_goals_against: row["xGoalsAgainst"],
          x_rebounds_against: row["xReboundsAgainst"],
          x_freeze_against: row["xFreezeAgainst"],
          x_play_stopped_against: row["xPlayStoppedAgainst"],
          x_play_continued_in_zone_against: row["xPlayContinuedInZoneAgainst"],
          x_play_continued_outside_zone_against: row["xPlayContinuedOutsideZoneAgainst"],
          flurry_adjusted_x_goals_against: row["flurryAdjustedxGoalsAgainst"],
          score_venue_adjusted_x_goals_against: row["scoreVenueAdjustedxGoalsAgainst"],
          flurry_score_venue_adjusted_x_goals_against: row["flurryScoreVenueAdjustedxGoalsAgainst"],
          shots_on_goal_against: row["shotsOnGoalAgainst"],
          missed_shots_against: row["missedShotsAgainst"],
          blocked_shot_attempts_against: row["blockedShotAttemptsAgainst"],
          shot_attempts_against: row["shotAttemptsAgainst"],
          goals_against: row["goalsAgainst"],
          rebounds_against: row["reboundsAgainst"],
          rebound_goals_against: row["reboundGoalsAgainst"],
          freeze_against: row["freezeAgainst"],
          play_stopped_against: row["playStoppedAgainst"],
          play_continued_in_zone_against: row["playContinuedInZoneAgainst"],
          play_continued_outside_zone_against: row["playContinuedOutsideZoneAgainst"],
          saved_shots_on_goal_against: row["savedShotsOnGoalAgainst"],
          saved_unblocked_shot_attempts_against: row["savedUnblockedShotAttemptsAgainst"],
          penalties_against: row["penaltiesAgainst"],
          penalty_minutes_against: row["penalityMinutesAgainst"],
          face_offs_won_against: row["faceOffsWonAgainst"],
          hits_against: row["hitsAgainst"],
          takeaways_against: row["takeawaysAgainst"],
          giveaways_against: row["giveawaysAgainst"],
          low_danger_shots_against: row["lowDangerShotsAgainst"],
          medium_danger_shots_against: row["mediumDangerShotsAgainst"],
          high_danger_shots_against: row["highDangerShotsAgainst"],
          low_danger_x_goals_against: row["lowDangerxGoalsAgainst"],
          medium_danger_x_goals_against: row["mediumDangerxGoalsAgainst"],
          high_danger_x_goals_against: row["highDangerxGoalsAgainst"],
          low_danger_goals_against: row["lowDangerGoalsAgainst"],
          medium_danger_goals_against: row["mediumDangerGoalsAgainst"],
          high_danger_goals_against: row["highDangerGoalsAgainst"],
          score_adjusted_shots_attempts_against: row["scoreAdjustedShotsAttemptsAgainst"],
          unblocked_shot_attempts_against: row["unblockedShotAttemptsAgainst"],
          score_adjusted_unblocked_shot_attempts_against: row["scoreAdjustedUnblockedShotAttemptsAgainst"],
          d_zone_giveaways_against: row["dZoneGiveawaysAgainst"],
          x_goals_from_x_rebounds_of_shots_against: row["xGoalsFromxReboundsOfShotsAgainst"],
          x_goals_from_actual_rebounds_of_shots_against: row["xGoalsFromActualReboundsOfShotsAgainst"],
          rebound_x_goals_against: row["reboundxGoalsAgainst"],
          total_shot_credit_against: row["totalShotCreditAgainst"],
          score_adjusted_total_shot_credit_against: row["scoreAdjustedTotalShotCreditAgainst"],
          score_flurry_adjusted_total_shot_credit_against: row["scoreFlurryAdjustedTotalShotCreditAgainst"]
        )
      end
    end

    puts "Data for #{type} in #{year} fetched and processed."
  end
end
