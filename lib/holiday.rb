require 'pry'

# Defining holiday_hash as a global variable within this class to test the methods
holiday_hash = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # adds a new holiday and its associated supplies to any season
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []

  holiday_hash[:winter][:christmas].each do |supply|
    winter_supplies << supply
  end
  holiday_hash[:winter][:new_years].each do |supply|
    winter_supplies << supply
  end

  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, holidays|
    # Puts out each season key, converted to a string and capitalizes that string
    puts "#{season.to_s.capitalize}:"

    holidays.each do |holiday_name, supplies|
      # temp_holiday_name temporarily stores each holiday name, split up into words, as an array to be operated on
      temp_holiday_name = holiday_name.to_s.split("_")
      ########################## Putting to test below
      # puts temp_holiday_name

      # holiday_name_and_supplies temporarily stores all the supplies for each separate holiday as a string to be put out later all in one line
      # Reassign holiday_name_and_supplies to an empty string
      holiday_name_and_supplies = ""

        # Iterate over temp_holiday_name array to capitalize each word in the array
        temp_holiday_name.each do |split_holiday_name_into_words|
          split_holiday_name_into_words.capitalize!
          ########################## Putting to test below
          # puts split_holiday_name_into_words
        end

      # #join the split holiday name words, now capitalized, back into a string
      capitalized_holiday_name = temp_holiday_name.join(" ")
      # Putting to test below
      # puts capitalized_holiday_name

      # Appends capitalized_holiday_name into holiday_name_and_supplies to be put out on later
      holiday_name_and_supplies += "  #{capitalized_holiday_name}: "

      

      supplies.each_with_index do |supply, supply_index|
        # Appends supply to holiday_name_and_supplies to be put out in one line
        holiday_name_and_supplies += "#{supply}"
        # Adds a comma between each holiday supply, as long as it's not the last item in the supplies array
        if supply_index < supplies.length - 1
          holiday_name_and_supplies += ", "
        end
      end
      # Puts out supplies for each separate holiday as a string
      puts holiday_name_and_supplies
    end
  end

end

# Invoking #all_supplies_in_holidays to test method
# all_supplies_in_holidays(holiday_hash)

# Posting holiday_hash below for reference
# holiday_hash = {
#   :winter => {
#     :christmas => ["Lights", "Wreath"],
#     :new_years => ["Party Hats"]
#   },
#   :summer => {
#     :fourth_of_july => ["Fireworks", "BBQ"]
#   },
#   :fall => {
#     :thanksgiving => ["Turkey"]
#   },
#   :spring => {
#     :memorial_day => ["BBQ"]
#   }
# }
def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  # holidays_with_BBQ array stores the holidays with BBQ supply to be returned in the method
  holidays_with_BBQ = []

  # Iterate through holiday_hash
  holiday_hash.each do |season, holiday|
    
    # Iterate through holiday_hash[:season_keys]
    holiday.each do |holiday_name, supplies|

      if supplies.include?("BBQ")
        holidays_with_BBQ << holiday_name
      end # If supplies include "BBQ"

      # Iterate through [holiday_hash][:season_key][supply] to see if supply includes a value of "BBQ"
      # supplies.each do |supply|

      # end # Iterate through [holiday_hash][:season_key][supply]

    end # Iterate through holiday_hash[:season_keys]

  end # Iterate through holiday_hash

  holidays_with_BBQ
end

# Invoking #all_holidays_with_bbq below to test method
# all_holidays_with_bbq(holiday_hash)




