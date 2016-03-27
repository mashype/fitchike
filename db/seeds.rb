# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Gender.create([{ gender: 'Male' }, { gender: 'Female' }])
Workout.create([{ type_name: 'Interval Training' }, { type_name: 'Yoga - Traditional' }, { type_name: 'Studio' }])
Location_type.create([{ type_name: 'Home' }, { type_name: 'Gym' }, { type_name: 'Studio' }])
Certification.create([{ cert_name: 'P-90 Certified Trainer' }, { type_name: 'Certified Yoga' }, { type_name: 'Certified PreNatal' }])
