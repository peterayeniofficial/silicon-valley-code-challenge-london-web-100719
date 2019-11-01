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


end