# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_09_210453) do
  create_table "seasons", force: :cascade do |t|
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_stats", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "season_id", null: false
    t.string "name"
    t.string "position"
    t.string "situation"
    t.integer "games_played"
    t.float "x_goals_percentage"
    t.float "corsi_percentage"
    t.float "fenwick_percentage"
    t.float "ice_time"
    t.float "x_on_goal_for"
    t.float "x_goals_for"
    t.float "x_rebounds_for"
    t.float "x_freeze_for"
    t.float "x_play_stopped_for"
    t.float "x_play_continued_in_zone_for"
    t.float "x_play_continued_outside_zone_for"
    t.float "flurry_adjusted_x_goals_for"
    t.float "score_venue_adjusted_x_goals_for"
    t.float "flurry_score_venue_adjusted_x_goals_for"
    t.integer "shots_on_goal_for"
    t.integer "missed_shots_for"
    t.integer "blocked_shot_attempts_for"
    t.integer "shot_attempts_for"
    t.integer "goals_for"
    t.integer "rebounds_for"
    t.integer "rebound_goals_for"
    t.integer "freeze_for"
    t.integer "play_stopped_for"
    t.integer "play_continued_in_zone_for"
    t.integer "play_continued_outside_zone_for"
    t.integer "saved_shots_on_goal_for"
    t.integer "saved_unblocked_shot_attempts_for"
    t.integer "penalties_for"
    t.integer "penalty_minutes_for"
    t.integer "face_offs_won_for"
    t.integer "hits_for"
    t.integer "takeaways_for"
    t.integer "giveaways_for"
    t.integer "low_danger_shots_for"
    t.integer "medium_danger_shots_for"
    t.integer "high_danger_shots_for"
    t.float "low_danger_x_goals_for"
    t.float "medium_danger_x_goals_for"
    t.float "high_danger_x_goals_for"
    t.integer "low_danger_goals_for"
    t.integer "medium_danger_goals_for"
    t.integer "high_danger_goals_for"
    t.float "score_adjusted_shots_attempts_for"
    t.integer "unblocked_shot_attempts_for"
    t.float "score_adjusted_unblocked_shot_attempts_for"
    t.integer "d_zone_giveaways_for"
    t.float "x_goals_from_x_rebounds_of_shots_for"
    t.float "x_goals_from_actual_rebounds_of_shots_for"
    t.float "rebound_x_goals_for"
    t.float "total_shot_credit_for"
    t.float "score_adjusted_total_shot_credit_for"
    t.float "score_flurry_adjusted_total_shot_credit_for"
    t.float "x_on_goal_against"
    t.float "x_goals_against"
    t.float "x_rebounds_against"
    t.float "x_freeze_against"
    t.float "x_play_stopped_against"
    t.float "x_play_continued_in_zone_against"
    t.float "x_play_continued_outside_zone_against"
    t.float "flurry_adjusted_x_goals_against"
    t.float "score_venue_adjusted_x_goals_against"
    t.float "flurry_score_venue_adjusted_x_goals_against"
    t.integer "shots_on_goal_against"
    t.integer "missed_shots_against"
    t.integer "blocked_shot_attempts_against"
    t.integer "shot_attempts_against"
    t.integer "goals_against"
    t.integer "rebounds_against"
    t.integer "rebound_goals_against"
    t.integer "freeze_against"
    t.integer "play_stopped_against"
    t.integer "play_continued_in_zone_against"
    t.integer "play_continued_outside_zone_against"
    t.integer "saved_shots_on_goal_against"
    t.integer "saved_unblocked_shot_attempts_against"
    t.integer "penalties_against"
    t.integer "penalty_minutes_against"
    t.integer "face_offs_won_against"
    t.integer "hits_against"
    t.integer "takeaways_against"
    t.integer "giveaways_against"
    t.integer "low_danger_shots_against"
    t.integer "medium_danger_shots_against"
    t.integer "high_danger_shots_against"
    t.float "low_danger_x_goals_against"
    t.float "medium_danger_x_goals_against"
    t.float "high_danger_x_goals_against"
    t.integer "low_danger_goals_against"
    t.integer "medium_danger_goals_against"
    t.integer "high_danger_goals_against"
    t.float "score_adjusted_shots_attempts_against"
    t.integer "unblocked_shot_attempts_against"
    t.float "score_adjusted_unblocked_shot_attempts_against"
    t.integer "d_zone_giveaways_against"
    t.float "x_goals_from_x_rebounds_of_shots_against"
    t.float "x_goals_from_actual_rebounds_of_shots_against"
    t.float "rebound_x_goals_against"
    t.float "total_shot_credit_against"
    t.float "score_adjusted_total_shot_credit_against"
    t.float "score_flurry_adjusted_total_shot_credit_against"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_team_stats_on_season_id"
    t.index ["team_id"], name: "index_team_stats_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "team_stats", "seasons"
  add_foreign_key "team_stats", "teams"
end
