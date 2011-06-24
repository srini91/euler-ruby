# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.

# How many routes are there through a 20x20 grid?

beg = Time.now

SIZE_X = 20
SIZE_Y = 20

CALC_ROUTES_CACHE = {}

def calc_routes(x, y)
  return CALC_ROUTES_CACHE["#{x}--#{y}"] unless CALC_ROUTES_CACHE["#{x}--#{y}"].nil?
  if (x == SIZE_X+1) or (y == SIZE_Y+1)
    poses = 1
  else
    poses = calc_routes(x+1, y) + calc_routes(x, y+1)
  end
  CALC_ROUTES_CACHE["#{x}--#{y}"] = poses
  return poses
end

puts calc_routes(1,1)

puts (Time.now-beg)