FactoryGirl.define do
  factory :user do
    email "abc@gmail.com"
    password "123"
    password_confirmation "123"
  end
end