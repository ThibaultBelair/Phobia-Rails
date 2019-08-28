class Phobia < ApplicationRecord
  def self.from(keyword)
    @phobias = Phobia.all
    @phobias.each do |phobia|
      phobia.find(phobia.id).keywords.include?(@keyword)
    end
  end
end
