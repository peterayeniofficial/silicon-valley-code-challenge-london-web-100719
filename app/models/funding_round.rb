class FundingRound
  attr_reader :startup, :venture_capitalist, :investment_amount, :type
  @@all = []

  def initialize(type, _investment_amount, startup, venture_capitalist)
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
