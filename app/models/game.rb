class Game < ApplicationRecord
  has_secure_token

  has_many :players
  has_many :lands
  has_many :nodes

  enum status: { in_process: 0, finished: 1 }

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
#  status     :integer          default("in_process")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_games_on_token  (token) UNIQUE
#
