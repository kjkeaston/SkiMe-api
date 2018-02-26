require 'csv'

Post.destroy_all
Trail.destroy_all
Resort.destroy_all
User.destroy_all

# => RESORTS
heavenly = Resort.create(name: "Heavenly Mountain Resort")
northstar = Resort.create(name: "Northstar California")
kirkwood = Resort.create(name: "Kirkwood Mountain Resort")

# => TRAILS
csv_heavenly_text = File.read(Rails.root.join('lib', 'seeds', 'heavenly_trails.csv'))
csv_heavenly = CSV.parse(csv_heavenly_text, :headers => true, :encoding => 'ISO-8859-1')
csv_heavenly.each do |row|
  t = Trail.create(name: row['name'], difficulty: row['difficulty'], resort: heavenly)
end

csv_northstar_text = File.read(Rails.root.join('lib', 'seeds', 'northstar_trails.csv'))
csv_northstar = CSV.parse(csv_northstar_text, :headers => true, :encoding => 'ISO-8859-1')
csv_northstar.each do |row|
  t = Trail.create(name: row['name'], difficulty: row['difficulty'], resort: northstar)
end

csv_kirkwood_text = File.read(Rails.root.join('lib', 'seeds', 'kirkwood_trails.csv'))
csv_kirkwood = CSV.parse(csv_kirkwood_text, :headers => true, :encoding => 'ISO-8859-1')
csv_kirkwood.each do |row|
  t = Trail.create(name: row['name'], difficulty: row['difficulty'], resort: kirkwood)
end

# => USERS
def random_discipline
  ["Skier", "Snowboarder", "Both"].sample
end

def random_ability
  ["Beginner", "Intermediate", "Advanced", "Expert", "Full Send on Everything"].sample
end

def random_home_mountain
  ["Copper Mountain", "Heavenly Mountain Resort", "Kirkwood Mountain Resort", "Northstar California", "Jackson Hole Mountain Resort", "Breckenridge Ski Resort", "Keystone Resort", "Revelstoke Mountain Resort"].sample
end

users_data = []
10.times do
  first = FFaker::Name.first_name
  last = FFaker::Name.last_name
  users_data << {
    first_name: first,
    last_name: last,
    home_mountain: random_home_mountain,
    discipline: random_discipline,
    ability: random_ability,
    photo: "https://www.sparklabs.com/forum/styles/comboot/theme/images/default_avatar.jpg",
    email: "#{first[0]}_#{last}@example.com".downcase,
    password: "Passwor0d"
  }
end

users = User.create(users_data)

# => POSTS
def random_star_rating
  ["1", "2", "3", "4", "5"].sample
end

def get_snow_condition(snow)
  snow_con = {
    "1": "Icy, crusty",
    "2": "Poor coverage, chopped up",
    "3": "Packed powder but gets the job done",
    "4": "Packed powder but gets the job done",
    "5": "Fresh pow, bring your snorkel"
  }
  return snow_con[snow]
end

def get_crowd_level(crowd)
  crowd_lev = {
    "1": "Packed, people everywhere",
    "2": "Average, about what you'd expect",
    "3": "Average, about what you'd expect",
    "4": "Had the run to myself",
    "5": "Had the run to myself"
  }
  return crowd_lev[crowd]
end

# def random_snow_condition
#   ["Icy, crusty", "Poor coverage, chopped up", "Packed powder but gets the job done", "Fresh pow, bring your snorkel"].sample
# end

# def random_crowd_level
#   ["Packed, people everywhere", "Average, about what you'd expect", "Had the run to myself"].sample
# end

def random_notes
  ["Saw a bear", "Poor coverage in the trees", "People sitting in the middle of trail", "", "Went full send and lost my ski pass"].sample
end

posts_data = []
200.times do
  star_rating_assigned = random_star_rating
  posts_data << {
    user: User.all.sample,
    trail: Trail.all.sample,
    star_rating: star_rating_assigned,
    snow_condition: get_snow_condition(star_rating_assigned.to_sym),
    crowd_level: get_crowd_level(star_rating_assigned.to_sym),
    notes: random_notes
  }
end

posts = Post.create(posts_data)
