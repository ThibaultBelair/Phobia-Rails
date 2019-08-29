class Phobia < ApplicationRecord
  def self.from(word)
    @phobias = Phobia.all
    @phobias.each do |phobia|
      Phobia.find(phobia.id).keywords.include?(word)
    end
  end
end
