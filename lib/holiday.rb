require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, items|
        items << supply
      end
    end
  end
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, items|
      if holiday == :memorial_day
        items << supply
      end
    end
  end
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  winter_array = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, items|
        winter_array << items
      end
    end
  end
  winter_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, holiday|
    puts "#{season.to_s.capitalize}:"

    holiday.each do |holiday, items|
      puts "  #{holiday.to_s.split("_").collect{|w| w.capitalize}.join(" ")}: #{items.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  result = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, items|
      if items.include?("BBQ")
        result << holiday
      end
    end
  end
  result
end
