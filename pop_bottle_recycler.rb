# Poppin' Bottles
# You've just been hired at Lighthouse Markets,
# a reputable (and thoroughly fictional) grocery store chain.
# One of the primary features of Lighthouse Markets is their recycling program
# on pop bottles. Here is how the program works:

# For every two empty bottles, you can get one free (full) bottle of pop
# For every four bottle caps, you can get one free (full) bottle of pop
# Each bottle of pop costs $2 to purchase
# Given these parameters,
# write a program so that you can figure out how many total bottles of pop
# can be redeemed given a customer investment.

# Task 1
# Figure out the algorithm that will calculate this.
# For example, given a $20 investment, the customer will get 10 bottles of pop.
# That gives a supply of both bottles and bottle caps that can be used to redeem
#  for further bottles, which will then produce a further supply for recycling.

# attempt at recursive solution that is not correct

def total_bottles(original_quantity_purchased)

  return 1 if original_quantity_purchased <= 1

  #  1 empty bottle gets 1/2 full bottle and 1/4 bottle for bottle cap

  full_bottles_from_recycling = 0.75 * original_quantity_purchased

  full_bottles_from_recycling = full_bottles_from_recycling.floor()

  puts "original_quantity_purchased #{original_quantity_purchased}  full_bottles_from_recycling #{full_bottles_from_recycling}"

  original_quantity_purchased + total_bottles(full_bottles_from_recycling)

end

# original_bottles = 10

# puts "original bottles #{original_bottles} total bottles #{total_bottles(original_bottles)}"

# ===============================================================

def iterative_total_bottles(original_bottles_purchased)

  # definitions
  #
  # a "round" is when customer returns to the store with empty bottles and caps
  #      to purchase full bottles
  #
  # total_bottles_bought - the total number bottles bought in all rounds when
  #      the customer returns all bottles to buy more full bottles
  #      and then returns those bottles, and so on until he/she runs out of bottles to return.

  # total_bottles_bought_thru_bottle_recycling
  #
  # total_bottles_bought_thru_cap_recycling
  #
  # nbr_bottles_returned -  equals the nbr full bottles bought with empty bottles and caps in the previoues round
  #       It is the sum of nbr_bottles_redeemed_from_bottles plus nbr_bottles_redeemed_from_caps in previous round
  #
  # remaining_caps - caps not redeemed for bottles in the current round, must be 3 or fewer
  #
  # remaining_bottles - botles not redeemed for bottles in the current round, most be 1 or 0
  #
  # total_caps - is the sum of the "remaining_caps" not redeemed in the previous round
  #       and the the caps on the botttles returned in this round
  #
  # total_bottles - the sum of the "remaining bottles" which were not redeemed in the previous round
  #       and the bottles returned in this round
  #
  # nbr_bottles_redeemed_from_bottles - is number bottles redeemed from total_bottles
  #
  # nbr_bottles_redeemed_from_caps - is number of bottles redeemed from total_caps
  #
  # old_nbr_bottles_returned - is just a variable for printing purposes
  #
  #  old_total_caps  - is just a variable for printing purposes
  #


  total_bottles_bought = original_bottles_purchased
  nbr_bottles_returned = original_bottles_purchased
  total_caps = 0

  remaining_bottles = 0

  remaining_caps = 0
  total_bottles_bought_thru_bottle_recycling = 0
  total_bottles_bought_thru_cap_recycling = 0

  while (nbr_bottles_returned + remaining_bottles) >= 2 || (nbr_bottles_returned + remaining_caps) >= 4 do

    puts "nbr_bottles_returned #{nbr_bottles_returned}"
    puts "remaining_bottles #{remaining_bottles}"
    puts "nbr_bottles_returned + remaining_bottles #{nbr_bottles_returned + remaining_bottles}"
    puts ""
    puts "nbr_bottles_returned #{nbr_bottles_returned}"
    puts "remaining_caps #{remaining_caps}"
    puts "nbr_bottles_returned + remaining_caps #{nbr_bottles_returned + remaining_caps}"
    puts ""

    total_caps = nbr_bottles_returned + remaining_caps
    puts "total_caps = nbr_bottles_returned + remaining_caps"
    puts "#{total_caps} = #{nbr_bottles_returned} + #{remaining_caps}"

    total_bottles = nbr_bottles_returned + remaining_bottles
    puts "total_bottles = nbr_bottles_returned + remaining_bottles"
    puts "#{total_bottles} = #{nbr_bottles_returned} + #{remaining_bottles}"


    nbr_bottles_redeemed_from_bottles = (total_bottles / 2).floor
    puts "nbr_bottles_redeemed_from_bottles = (total_bottles / 2).floor"
    puts "#{nbr_bottles_redeemed_from_bottles} = (#{total_bottles} / 2).floor"

    total_bottles_bought_thru_bottle_recycling += nbr_bottles_redeemed_from_bottles
    puts "so far total_bottles_bought_thru_bottle_recycling += nbr_bottles_redeemed_from_bottles"
    puts "#{total_bottles_bought_thru_bottle_recycling}"

    remaining_bottles = total_bottles - (nbr_bottles_redeemed_from_bottles * 2)
    puts "remaining_bottles = total_bottles - (nbr_bottles_redeemed_from_bottles * 2)"
    puts "#{remaining_bottles} = #{total_bottles} - (#{nbr_bottles_redeemed_from_bottles} * 2)"


    nbr_bottles_redeemed_from_caps = (total_caps / 4).floor
    puts "nbr_bottles_redeemed_from_caps = (total_caps / 4).floor"
    puts "#{nbr_bottles_redeemed_from_caps} = (#{total_caps} / 4).floor"

    total_bottles_bought_thru_cap_recycling += nbr_bottles_redeemed_from_caps
    puts "so far total_bottles_bought_thru_cap_recycling += nbr_bottles_redeemed_from_caps"
    puts "#{total_bottles_bought_thru_cap_recycling}"

    remaining_caps = total_caps - (nbr_bottles_redeemed_from_caps * 4)
    puts "remaining_caps = total_caps - (nbr_bottles_redeemed_from_caps * 4)"
    puts "#{remaining_caps} = #{total_caps} - (#{nbr_bottles_redeemed_from_caps} * 4)"

    #old_nbr_bottles_returned = nbr_bottles_returned
    nbr_bottles_returned = nbr_bottles_redeemed_from_bottles + nbr_bottles_redeemed_from_caps
    puts "future nbr_bottles_returned = nbr_bottles_redeemed_from_bottles + nbr_bottles_redeemed_from_caps"
    puts "#{nbr_bottles_returned} = #{nbr_bottles_redeemed_from_bottles} + #{nbr_bottles_redeemed_from_caps}"

    old_total_bottles_bought = total_bottles_bought
    total_bottles_bought += nbr_bottles_returned
    puts "total_bottles_bought = total_bottles_bought + nbr_bottles_returned"
    puts "#{total_bottles_bought} = #{old_total_bottles_bought} + #{nbr_bottles_returned}"

    puts ""
    puts "======================================================================="
    puts ""
  end

  puts ""
  puts "remaining_bottles #{remaining_bottles}"
  puts "remaining_caps #{remaining_caps}"
  puts "total bottles bought #{total_bottles_bought}"
end

# iterative_total_bottles(10)

# ===============================================================


# Task 2
# Write a REPL that will prompt the user for the amount (in dollars)
# that the customer is going to spend. The REPL will
# then calculate the total number of bottles that the customer will receive
# and prompt for the next customer's amount.

def repl

  quit = false

  while !quit do

    puts "Enter the dollar amount, rounded to the nearest dollar, you will spend on pop: "

    dollar_amount = gets.chomp

    if dollar_amount != 'quit' && dollar_amount.to_f >= 2.00

      iterative_total_bottles(dollar_amount.to_f/2.0)

    end

    puts "invalid dollar amount, try again" if dollar_amount != 'quit' && dollar_amount.to_f < 2.00

    quit = true if dollar_amount == 'quit'

  end

end

repl

# Task 3
# Enhance the output of your program so that once the amount has been given,
#  it provides a breakdown of how many bottles were purchased,
# how many were obtained through bottle recycling,
# and how many were obtained through bottle cap recycling.

# Task 4
# Add to the output, so that the program will tell the customer
# how many bottles and bottle caps they will have left over.
# We have to upsell the customer on buying more pop after all!

# TIP! Iterate, Iterate, Iterate
# You hear this from us all the time, but build your code incrementally.
# Build it in small steps, and make sure you are confident
# and comfortable that the code is functioning correctly before you move on to the next step.

# TIP! @instance variables
# Your use of instance variables
# for keeping track of different variables will be very important here.

# BONUS!
# Write this same algorithm using recursion.

