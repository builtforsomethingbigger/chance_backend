require 'rubygems'
require 'faker'
require 'json'
charities = File.read(Rails.root.join("db","db.json"))
parsed = JSON.parse(charities)

UserEvent.destroy_all
Message.destroy_all
Donation.destroy_all
Event.destroy_all
Inbox.destroy_all
Charity.destroy_all
User.destroy_all

puts 'ALL MODELS DELETED'

User.create!(        
    first_name: "Xander",
    last_name: "Ham",
    username: "MR_TENBUCKS",
    dob: "1776-07-04",
    email_address: "alexander@ustreasury.gov",
    password: "GOATS",
    street_address: "414 West 141st Street",
    street_address_2: "The Hamilton Grange Estate",
    city: "New York",
    zip: 10031,
    phone_number: "(212)704-1776",
    cc_number: Faker::Business.credit_card_number,
    cc_exp_date: Faker::Date.birthday(min_age: 1, max_age: 3),
    cc_type: "American Express",
    cc_cvv: 0330
)

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
        cc_cvv: rand(325...9748)
    )
end

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
            mailing_zipcode: charity["mailingAddress"]["postalCode"],
            user_id: User.all.sample.id
    )
    end
end

Donation.create(
    user_id: 1,
    charity_id: 3674,
    donation_amount: 1000,
    donation_date: "2020-06-22",
    donation_note: "To help with the Corona pandemic relief",
    favorite: true
)
Donation.create(
    user_id: 1,
    charity_id: 1843,
    donation_amount: 1500,
    donation_date: "2020-01-01",
    donation_note: "Annual donation",
    favorite: true
)
Donation.create(
    user_id: 1,
    charity_id: 2220,
    donation_amount: 750,
    donation_date: "2019-09-07",
    donation_note: "One-time donation",
    favorite: true
)
Donation.create(
    user_id: 1,
    charity_id: 781,
    donation_amount: 1000,
    donation_date: "2019-12-25",
    donation_note: "Annual donation. F*ck Cancer!",
    favorite: true
)


50.times do
    Donation.create!(
        user_id: User.all.sample.id,
        charity_id: Charity.all.sample.id,
        donation_amount: rand(100...1000),
        donation_date: Faker::Date.birthday(min_age: 0, max_age: 5),
        donation_note: Faker::GreekPhilosophers.quote
    )
end

100.times do
    Favorite.create!(
        user_id: User.all.sample.id,
        charity_id: Charity.all.sample.id
    )
end

status = ["Pending Approval", "Client Approved"]
50.times do
    Event.create!(
        user_id: User.all.sample.id,
        charity_id: Charity.all.sample.id,
        event_date: Faker::Date.birthday(min_age: 0, max_age: 1),
        event_title: Faker::Job.title,
        event_type: "Job Opportunity",
        event_description: Faker::Job.employment_type,
        event_status: status[rand(0..1)]
    )
end

# 10.times do
#     UserEvent.create!(
#         user_id: User.all.sample.id,
#         event_id: Event.all.sample.id
#     )
# end

Inbox.create(user_id: 1)

Message.create!(
    user_id: 5,
    inbox_id: 1,
    message_title: "Event Inquiry",
    message_body: Faker::Quote.matz    
)
Message.create!(
    user_id: 5,
    inbox_id: 1,
    message_title: "Event Inquiry",
    message_body: Faker::Quote.matz    
)
Message.create!(
    user_id: 5,
    inbox_id: 1,
    message_title: "Event Inquiry",
    message_body: Faker::Quote.matz    
)
5.times do 
    Message.create!(
        user_id: User.all.sample.id,
        inbox_id: 1,
        message_title: Faker::Job.title,
        message_body: Faker::Quote.matz    
    )
end

puts "Seeding Complete!"