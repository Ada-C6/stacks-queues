require_relative 'job-simulation'

job_seekers = ["A", "B", "C", "D", "E", "F", "H", "I", "J", "K", "L", "M", "N"]
company = CrazyCompany.new

job_seekers.each do |employee|
	company.waiting_list.enqueue(employee)
end

company.hire
puts "Hired!"
puts "Employed: " + company.employed.store.join(", ")
puts "Waiting list: " + company.waiting_list.store.join(", ")

company.fire
puts "Fired!"
puts "Employed: " + company.employed.store.join(", ")
puts "Waiting list: " + company.waiting_list.store.join(", ")
