# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

beg = Time.now

def cancel_digits(n,d)
  ns = n.to_s.split(//)
  ds = d.to_s.split(//)

  new_ns = []
  cancelled = false
  for i in (0..(ns.size-1))
    d_index = ds.index(ns[i])
    if d_index.nil?
      new_ns << ns[i]
    else
      ds.delete_at(d_index)      
      cancelled = true unless i == d_index
    end
  end

  return [new_ns.join("").to_i, ds.join("").to_i, cancelled]
end

num_prod, denom_prod = 1,1
for n in 10..99
  for d in (n+1)..99
    new_n, new_d, cancel = cancel_digits(n,d)
    next unless cancel
    if n.to_f/d.to_f == new_n.to_f/new_d.to_f
      num_prod *= n
      denom_prod *= d
    end
  end
end

puts denom_prod/num_prod
puts (Time.now-beg)