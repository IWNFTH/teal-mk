10.times do |n|
  Opportunity.create!(
    op_name: "株式会社#{n + 1}への販売について",
    user_id: 1,
    company: "株式会社#{n + 1}",
    company_area_id: 2,
    person_in_charge: "#{Faker::Name.initials(number: 2)}様",
    date_of_obtaining: "2022/06/01",
    phase_id: 1
  )
end

10.times do |n|
  Opportunity.create!(
    op_name: "株式会社#{n + 11}への販売について",
    user_id: 2,
    company: "株式会社#{n + 11}",
    company_area_id: 3,
    person_in_charge: "#{Faker::Name.initials(number: 2)}様",
    date_of_obtaining: "2022/06/02",
    phase_id: 2
  )
end

10.times do |n|
  Opportunity.create!(
    op_name: "株式会社#{n + 21}への販売について",
    user_id: 3,
    company: "株式会社#{n + 21}",
    company_area_id: 4,
    person_in_charge: "#{Faker::Name.initials(number: 2)}様",
    date_of_obtaining: "2022/06/03",
    phase_id: 3
  )
end