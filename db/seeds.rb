# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Version.destroy_all

Version.create(num_version: "1.0.0", date_version: '2015-01-01', new_version: true, support_version: false)
Version.create(num_version: "0.0.1", date_version: '2015-01-01', new_version: false, support_version: true)
puts "Insert version 1.1.0 ok"
