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

  def funding_rounds
    FundingRound.all.select {|funding| funding.venture_capitalist == self}
  end

  def self.tres_commas_club
    high_worths = all.select { |venture| venture.total_worth > 1_000_000_000 }
    high_worths.map{|capitalist| capitalist.name}
  end

  def offer_contract(startup, type, investment)
    FoundingRound.new(startup: startup, type: type, investment: investment, venture_capitalist: self)
  end

  def portfolio
    funding_rounds.map{|fund| fund.startup }.uniq
  end

  def biggest_investment
    funding_rounds.map {|fund| fund.investment}.max
  end

  def invested(domain)
    invested_in  = funding_rounds.find_all{|fund| fund.startup.domain == domain}
    invested_in.reduce(0){|total, s| total += s.investment }
  end


end
