class Game < ApplicationRecord
  has_secure_token

  has_many :lands

  enum status: { prepare: 0, in_process: 1, finished: 2 }

  after_create :initialize_game!

  private

  def initialize_game!
    GameInitializeService.new(self).perform!
  end
end

# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  token      :string           not null
#  status     :integer          default("prepare")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_games_on_token  (token) UNIQUE
#
