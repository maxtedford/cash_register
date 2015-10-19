class Register
  attr_reader :diff
  
  COINS = {
    25 => "quarter",
    10 => "dime",
    5 => "nickel",
    1 => "penny"
  }
  
  def initialize(price, pmt)
    @diff = pmt - price
  end
  
  def calculate_change
    change = []
    until diff == 0
      COINS.each do |amt, coin|
        if diff - amt >= 0
          change << coin
          @diff -= amt
          break
        end
      end
    end
    group_coins(change)
  end
  
  def group_coins(coins)
    coins.each_with_object(Hash.new(0)) { |coin, counts| counts[coin] += 1 }
  end
end

register = Register.new(936, 1000)
puts register.calculate_change
