require 'rubygems'
require 'faker'
require 'json'
charities = File.read("/Users/builtforsomethingbigger/Development/code/FINAL-PROJECT/chance-api/db/db.json")
parsed = JSON.parse(charities)

UserEvent.destroy_all
Inbox.destroy_all
Donation.destroy_all
Event.destroy_all
User.destroy_all
Charity.destroy_all
Message.destroy_all

parsed.each do |charity|
    found = Charity.find_by(ein: charity["ein"])
    if !found 
        Charity.create!(
            charity_name: charity["charityName"],
            ein: charity["ein"].to_i,
            tag_line: charity["tagLine"],
            mission: charity["mission"],
            website_url: charity["websiteURL"],
            current_rating: charity["currentRating"]["score"],
            financial_rating: charity["currentRating"]["financialRating"]["score"],
            accountability_rating: charity["currentRating"]["accountabilityRating"]["score"],
            cause: charity["cause"]["causeName"],
            income_amount: charity["irsClassification"]["incomeAmount"],
            mailing_street_address: charity["mailingAddress"]["streetAddress1"],
            mailing_street_address_2: charity["mailingAddress"]["streetAddress2"],
            mailing_city: charity["mailingAddress"]["city"],
            mailing_zipcode: charity["mailingAddress"]["postalCode"]
    )
    end
end

50.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.username,
        dob: Faker::Date.birthday(min_age: 18, max_age: 65),
        email_address: Faker::Internet.free_email,
        password: "chance",
        street_address: Faker::Address.street_address,
        street_address_2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        zip: Faker::Address.zip,
        phone_number: Faker::PhoneNumber.phone_number,
        cc_number: Faker::Business.credit_card_number,
        cc_exp_date: Faker::Date.birthday(min_age: 1, max_age: 3),
        cc_type: Faker::Business.credit_card_type,
        total_donation: 0
    )
end

30.times do
    Donation.create!(
        user_id: User.all.sample.id,
        charity_id: Charity.all.sample.id,
        donation_amount: rand(1000...2000000),
        donation_date: Faker::Date.birthday(min_age: 0, max_age: 5),
        donation_note: Faker::GreekPhilosophers.quote
    )
end

10.times do
    Event.create!(
        charity_id: Charity.all.sample.id,
        event_date: Faker::Date.birthday(min_age: 0, max_age: 1),
        event_title: Faker::Job.title,
        event_type: "Job Opportunity",
        event_description: Faker::Job.employment_type
    )
end

10.times do
    UserEvent.create!(
        user_id: User.all.sample.id,
        event_id: Event.all.sample.id
    )
end

25.times do
    Message.create!(
        message_title: Faker::Quote.yoda,
        message_body: Faker::Quote.matz    
    )
end

25.times do
    Inbox.create!(
        user_id: User.all.sample.id,
        message_id: Message.all.sample.id
    )
end

puts "Seeding Complete!"