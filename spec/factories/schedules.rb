FactoryBot.define do
  factory :schedule do
    client           {Faker::Company.name}
    person           {Faker::Name.last_name}
    content_id       {Faker::Number.between(from: 2, to: 7)}
    aim              {Faker::Lorem.sentence}
    starting_time    {'2021/07/31 00:00:00'}
    ending_time      {'2021/07/31 00:00:00'}
    product_id       {Faker::Number.between(from: 2, to: 11)}
    report           {Faker::Lorem.sentence}
    other            {Faker::Lorem.sentence}
    start_time       {'2021/07/31 00:00:00'}
    visit_date       {'2021/07/31 00:00:00'}
    association :user
  end
end
