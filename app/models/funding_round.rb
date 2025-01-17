class FundingRound

  attr_reader :startup, :venture_capitalist, :investment, :type
  @@all = []

  def initialize(startup:, venture_capitalist:, type:, investment:)
    @type = type
    @investment = investment
    @startup = startup
    @venture_capitalist = venture_capitalist

    @@all << self
  end

  def investment_amount=(amount)
    @investment_amount = 0.0 if amount < 0
    @investment_amount = amount.to_f
  end

  def self.all
    @@all
  end

end
