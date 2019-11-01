require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

peng = Startup.new("Peng", "Jill", "Health")
skill = Startup.new("Skril", "Peace", "EduTech")
fin = Startup.new("Revolut", "Ola", "FinTech")
mbele = Startup.new("Mbele", "Ola", "EduTech")

bcorp = VentureCapitalist.new("B Corp", 1_500_000_000)
ccorp = VentureCapitalist.new("C Corp", 1_00_000_000)
acorp = VentureCapitalist.new("A Corp", 2_500_000_000)

fin.sign_contract(acorp, "Pre-Seed", 21250000)
skill.sign_contract(bcorp, "Angel", 21250000)
peng.sign_contract(bcorp, "Series C", 211250000)
peng.sign_contract(ccorp, "Series A", 11250000)
peng.sign_contract(acorp, "Seed", 1250000)
mbele.sign_contract(acorp, "Angel", 21250000)
mbele.sign_contract(ccorp, "Pre-Seed", 321250000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line