# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

15.times do |index|
  specialties = Specialty.create!(name: Faker::HitchhikersGuideToTheGalaxy.specie)
  cities = City.create!(name: Faker::Simpsons.location)
end

10.times do |index|
  doctors = Doctor.create!(first_name: Faker::HitchhikersGuideToTheGalaxy.character, last_name: Faker::HitchhikersGuideToTheGalaxy.planet, postal_code: Faker::Address.zip, city_id: Faker::Number.between(1,10))
  patients = Patient.create!(first_name: Faker::Hipster.word, last_name: Faker::Hipster.word, city_id: Faker::Number.between(1, 10))
end

10.times do |meh|
  appointments = Appointment.create!(date: "2018111 #{Faker::Number.between(5, 23)}:#{Faker::Number.between(1, 59)}:00", doctor_id: Faker::Number.between(1, 10), patient_id: Faker::Number.between(1,10), city_id: Faker::Number.between(1, 10))
end

i = 1
while i < 10
Doctor.find(i).specialties <<  Specialty.find(i)
Doctor.find(i).specialties <<  Specialty.find(i+1)
i = i+1
end 

