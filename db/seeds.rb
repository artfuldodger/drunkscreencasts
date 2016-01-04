# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

password = SecureRandom.hex(20)

user = User.where(login: 'jon').first_or_create(
  password: password,
  password_confirmation: password
)

videos = [
  {
    youtube_id: 'vLXGKNA4P_g',
    title: 'Introduction to Ember CLI by building a blog (1/2)',
    description: "Let's build a blog and get to know Ember CLI.",
    published_at: Date.new(2015, 1, 3)
  },
  {
    youtube_id: 'eV6JRW6gOyI',
    title: 'Introduction to Ember CLI by building a blog (2/2)',
    description: "Let's build a blog and get to know Ember CLI. Part 2.",
    published_at: Date.new(2015, 1, 4)
  },
  {
    youtube_id: 'q0Sj0t1GBkU',
    title: 'Sharing thoughts in real time with Ember.js',
    description: "We'll build the most obnoxious interface ever and learn about
      making applications real-time with Firebase. We'll also touch on services
      and how to wrap third-party libraries with named AMD modules.",
    published_at: Date.new(2015, 5, 31)
  }
]

videos.each do |video|
  user.videos.where(youtube_id: video[:youtube_id]).create_with(
    title: video[:title],
    description: video[:description],
    published_at: video[:published_at]
  ).first_or_create
end
