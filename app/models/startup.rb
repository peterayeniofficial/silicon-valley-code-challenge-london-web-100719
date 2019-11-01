class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def self.all
    @@all
  end

  def pivot (domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_finder(founder_name)
    found = all.find { |startup| startup.founder == founder_name }
    found ? found.name : nil
  end

  def self.domains
    all.map(&:domain)
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(venture_capitalist: venture_capitalist, type: type, investment: investment, startup: self)
  end

  def fundings
    FundingRound.all.select{|funding| funding.startup == self}
  end

  def num_funding_rounds
    fundings.count
  end

  def total_funds
    fundings.reduce(0){|total, fund| total += fund.investment}
  end

  def investors
    fundings.map{|funding| funding.venture_capitalist.name}.uniq
  end

  def big_investors
    investors.find_all{|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end

end