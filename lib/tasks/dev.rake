namespace :dev do
  desc 'Configures development environment'
  task setup: :environment do
    # Generates contact_types
    puts 'Generating contact types...'
    contact_types = %w[Friends Family Business]
    contact_types.each do |type|
      Type.create!(description: type)
    end
    puts 'Contact types generated succesfully!'

    # Generates contacs
    puts 'Generating contacts...'
    10.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 60.years.ago, to: 18.years.ago),
        type_id: Type.all.sample.id
      )
    end
    puts 'Contacts generated succesfully!'

    # Generates phones
    puts 'Generating phone numbers...'
    Contact.all.each do |contact|
      Random.rand(3).times do |_i|
        contact.phones.create!(number: Faker::PhoneNumber.cell_phone)
      end
    end
    puts 'Phone numbers succesfully generated!'
  end
end
