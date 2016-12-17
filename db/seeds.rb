Company.destroy_all
Job.destroy_all
Category.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Technology", "Sports", "Education", "Acting", "Media"]

CATEGORIES.each { |category| Category.create!(title: category)}

COMPANIES.each do |name|
 company = Company.create!(name: name)
 puts "Created #{company.name}"
 10.times do |num|
   company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category_id: CATEGORIES.sample)
   puts "  Created #{company.jobs[num].title}"
 end
end

Job.all.each do |job|
 categories = Category.all
 j = job
 j.category = categories.sample
 j.save
end
