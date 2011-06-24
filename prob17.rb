# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

beg = Time.now

# works in range 0..1000
def wordify(x)
  return "onethousand" if x == 1000

  return "" if x == 0
  return "one" if x == 1
  return "two" if x == 2
  return "three" if x == 3
  return "four" if x == 4
  return "five" if x == 5
  return "six" if x == 6
  return "seven" if x == 7
  return "eight" if x == 8
  return "nine" if x == 9
  return "ten" if x == 10
  return "eleven" if x == 11
  return "twelve" if x == 12
  return "thirteen" if x == 13
  return "fourteen" if x == 14
  return "fifteen" if x == 15
  return "sixteen" if x == 16
  return "seventeen" if x == 17
  return "eighteen" if x == 18
  return "nineteen" if x == 19

  return "twenty" if x == 20
  return "thirty" if x == 30
  return "forty" if x == 40
  return "fifty" if x == 50
  return "sixty" if x == 60
  return "seventy" if x == 70
  return "eighty" if x == 80
  return "ninety" if x == 90

  if x >= 100
    if x%100 == 0
      return wordify(x/100) + "hundred"
    end
    return wordify(x/100) + "hundredand" + wordify(x%100)
  end
  return wordify(x/10 * 10)  + wordify(x%10)
end

sum = 0
(1..1000).each {|i| sum += wordify(i).size}
puts sum

puts (Time.now-beg)