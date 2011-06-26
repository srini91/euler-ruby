# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1£1 + 150p + 220p + 15p + 12p + 31p
# How many different ways can £2 be made using any number of coins?

beg = Time.now

# solve for all combinations of a..h satisfying:
# a + 2b + 5c + 10d + 20e + 50f + 100g + 200h = 200

CALC_QUEUE = {}

$ways = 0

def calc_vals(a,b,c,d,e,f,g,h)
  val = a + 2*b + 5*c + 10*d + 20*e + 50*f + 100*g + 200*h
  $ways += 1 if val == 200
  return true if val >= 200
end

for a in 0..200
  next if calc_vals(a,0,0,0,0,0,0,0)
  for b in 0..((200-a)/2)
    next if calc_vals(a,b,0,0,0,0,0,0)
    for c in 0..((200-a-2*b)/5)
      next if calc_vals(a,b,c,0,0,0,0,0)
      for d in 0..((200-a-2*b-5*c)/10)
        next if calc_vals(a,b,c,d,0,0,0,0)
        for e in 0..((200-a-2*b-5*c-10*d)/20)
          next if calc_vals(a,b,c,d,e,0,0,0)
          for f in 0..((200-a-2*b-5*c-10*d-20*e)/50)
            next if calc_vals(a,b,c,d,e,f,0,0)
            for g in 0..((200-a-2*b-5*c-10*d-20*e-50*f)/100)
              next if calc_vals(a,b,c,d,e,f,g,0)
            end
          end
        end
      end
    end
  end
end

$ways += 1  # h = 1 case

puts $ways
puts (Time.now-beg)