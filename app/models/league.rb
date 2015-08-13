class League < ActiveRecord::Base
  validates :name, :match_type, presence: true
  validates :public, :redraft, inclusion: { in: [ true, false ] }
  validates :num_teams, numericality: { greater_than: 8 }
  validates :num_divisions, numericality: { less_than: 4 }

  has_many :teams
  has_one(
    :score_rule,
    class_name: "ScoreRule",
    foreign_key: :league_id,
    primary_key: :id
  )

  has_one :roster_rule

  belongs_to(
    :commissioner,
    class_name: "User",
    foreign_key: :commissioner_id,
    primary_key: :id
  )

  has_many :league_invites

  def current_user_team
  end
end
