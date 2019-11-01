class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def fundings
    FundingRound.all.select {|funding| funding.venture_capitalist == self}
  end

  def self.tres_commas_club
    high_worths = all.select { |venture| venture.total_worth > 1_000_000_000 }
    high_worths.map{|capitalist| capitalist.name}
  end

end
