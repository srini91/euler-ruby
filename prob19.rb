# You are given the following information, but you may prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

beg = Time.now

i = 1
cur_day = 1
cur_month = 1
cur_year = 1900

num_sundays_first_of_month = 0

while (cur_year < 2001)
  if (i % 7 == 0) and (cur_day == 1) and (cur_year >= 1901)
    num_sundays_first_of_month += 1
  end

  i+=1;

  # calc next date
  if cur_day < 28
    cur_day += 1
  elsif (cur_day == 28)
    if cur_month != 2
      cur_day += 1
    else
      if (cur_year % 400 == 0) or ((cur_year % 4 == 0) and (cur_year % 100 != 0))
        cur_day += 1
      else
        cur_day = 1
        cur_month += 1
      end
    end
  elsif (cur_day == 29)
    if cur_month != 2
      cur_day += 1
    else
      cur_day = 1
      cur_month += 1
    end
  elsif (cur_day == 30)
    if [4,6,9,11].include?(cur_month)
      cur_day = 1
      cur_month += 1
    else
      cur_day += 1
    end
  else
    cur_day = 1
    if cur_month == 12
      cur_month = 1
      cur_year += 1
    else
      cur_month += 1
    end     
  end

end

puts num_sundays_first_of_month
puts (Time.now-beg)