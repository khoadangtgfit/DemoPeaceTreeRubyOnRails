puts '~> Create activites'

Project.all.each do |project|
  2.times do
    project.activities.create!(
      name: Faker::Name.name,
      description: Faker::Address.full_address,
      startdate: Faker::Date.between(from: '2023-02-6', to: '2024-09-25'),
      time: [:Morning, :Afternoon, :Evening].sample
    )
  end
end
