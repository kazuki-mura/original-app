FactoryBot.define do
  factory :user do
    last_name             {'田中'}
    first_name            {'太郎'}
    email                 {'test@example.com'}
    password              {'000000'}
    password_confirmation {password}
  end
end