require_relative 'job-simulation'

candidates = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N"]
company = CrazyCompany.new(candidates)

company.hire
puts "Hired!"
puts "Employed: " + company.employed.store.join(", ")
puts "Waiting list: " + company.waiting_list.store.join(", ")

5.times do
	company.fire
	puts "Fired!"
	puts "Employed: " + company.employed.store.join(", ")
	puts "Waiting list: " + company.waiting_list.store.join(", ")	
end
