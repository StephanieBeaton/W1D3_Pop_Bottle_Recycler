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

def total_bottles(original_quantity_purchased)

  return 1 if original_quantity_purchased <= 1

  #  1 empty bottle gets 1/2 full bottle and 1/4 bottle for bottle cap

  full_bottles_from_recycling = 0.75 * original_quantity_purchased

  full_bottles_from_recycling = full_bottles_from_recycling.floor()

  puts "original_quantity_purchased #{original_quantity_purchased}  full_bottles_from_recycling #{full_bottles_from_recycling}"

  original_quantity_purchased + total_bottles(full_bottles_from_recycling)

end

original_bottles = 10

# puts "original bottles #{original_bottles} total bottles #{total_bottles(original_bottles)}"

# ===============================================================

def iterative_total_bottles(original_bottles_purchased)

  total_bottles_bought = original_bottles_purchased
  nbr_bottles_returned = original_bottles_purchased
  total_caps = 0

  remaining_bottles = 0

  remaining_caps = 0

  while (nbr_bottles_returned + remaining_bottles) >= 2 || (nbr_bottles_returned + remaining_caps) >= 4 do

    total_caps = nbr_bottles_returned + remaining_caps

    total_bottles = nbr_bottles_returned + remaining_bottles


    nbr_bottles_redeemed_from_bottles = (total_bottles / 2).floor

    remaining_bottles = total_bottles - (nbr_bottles_redeemed_from_bottles * 2)

    nbr_bottles_redeemed_from_caps = (total_caps / 4).floor

    remaining_caps = total_caps - (nbr_bottles_redeemed_from_caps * 4)

    old_nbr_bottles_returned = nbr_bottles_returned
    nbr_bottles_returned = nbr_bottles_redeemed_from_bottles + nbr_bottles_redeemed_from_caps

    total_bottles_bought += nbr_bottles_returned

    old_total_caps = total_caps

    puts "nbr_bottles_returned #{old_nbr_bottles_returned} | additional caps from bottles returned #{old_nbr_bottles_returned} | total_caps #{old_total_caps} | nbr bottles redeemed from bottles #{nbr_bottles_redeemed_from_bottles} | nbr bottles redeemed from caps #{nbr_bottles_redeemed_from_caps} | remaining caps after caps were redeemed #{remaining_caps} | total nbr full bottles from recycling #{nbr_bottles_returned}"

    # puts "nbr_bottles_returned #{old_nbr_bottles_returned} "
    # puts "additional caps from bottles returned #{old_nbr_bottles_returned}"
    # puts "nbr bottles earned from bottles #{nbr_bottles_returned_from_bottles}"
    # puts "nbr bottles earned from caps #{nbr_bottles_returned_from_caps}"

    # puts "remaining caps after caps were redeemed #{remainder_caps}"
    # puts "total_caps #{total_caps}"
    # puts "nbr full bottles from recycling #{nbr_bottles_returned}"


  end

  puts "total bottles bought #{total_bottles_bought}"
end

iterative_total_bottles(10)

# ===============================================================


# Task 2
# Write a REPL that will prompt the user for the amount (in dollars)
# that the customer is going to spend. The REPL will
# then calculate the total number of bottles that the customer will receive
# and prompt for the next customer's amount.

def repl

  quit = false

  while !quit do

    puts "Enter the dollar amount you will spend on pop: "

    dollar_amount = gets.chomp

    if dollar_amount != 'quit' && dollar_amount.to_f >= 2.00


      original_quantity_purchased = dollar_amount.to_f / 2.00
      original_quantity_purchased.floor()

      # total_bottles(original_quantity_purchased)
      puts "original_quantity_purchased #{original_quantity_purchased.to_i} total bottles #{total_bottles(original_quantity_purchased).to_i}"


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

