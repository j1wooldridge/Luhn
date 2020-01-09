module Luhn
  def self.is_valid?(ccard_number)

    str_nums = ccard_number.to_s.split(//)  #Step 1 - break the credit card into its individual digits.

    nums = Array.new

    str_nums.each do |str|
      nums << str.to_i  
    end

    nums.reverse!   #Step 2 - Start from the right

    sum = 0

    nums.each.with_index(1) do |n, i|    #Step 2 - Double every second digit (i.e., digit 2, 4, 6 etc.). 
      if i % 2 == 0    
        d = n * 2>9 ? n *2-9 : n *2     #Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
      else
        d = n
      end
      sum += d  #Step 4 - Sum the digits.
    end
    (sum % 10) == 0   #Step 5 - If the sum is divisible by 10, it's a valid number. Otherwise it's invalid
    
  end
end