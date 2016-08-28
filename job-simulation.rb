require './Stack.rb'
require './Queue.rb'
require './bad_company'

# Program below
first_applicants = ["Alana", "Bowser", "Cam", "Dalson", "Edgar", "Felix",
"Greta", "Hillary", "Inez", "Jackie", "Karolyn", "Lemoy", "Manon", "Nance",
"Oprah", "Paddy", "Quinn", "Rosa", "Sammie", "Tucker", "Underhill", "Viola",
"Wentworth", "Xavier", "Yadriel", "Zeynep"]

bc = BadCompany.new
bc.receive_applications(first_applicants)

puts "_" * 80
puts "
  BadCompany received #{ first_applicants.length.to_s } applications:\n\n"
puts bc.waiting_list.store

puts "_" * 80
puts "
  BadCompany hired 6 employees.\n\n"
bc.hire(6)

puts "_" * 80
puts "
  The remaining waiting list is:\n\n"
puts bc.waiting_list.store

3.times do
  puts "_" * 80
  puts "
  3 months have passed. Time to fire by dice roll.\n\n"
  bc.fool_turnover
  puts "_" * 80
  puts "
  BadCompany employee list after firing/hiring:\n\n"
  puts bc.employee_list.store
  puts "_" * 80
  puts "
  BadCompany waiting list after firing/hiring:\n\n"
  puts bc.waiting_list.store
end
