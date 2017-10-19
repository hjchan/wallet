FactoryGirl.define do
  factory :transaction do
    todo 0
    amount 1
    price 12
    date Date.today
  end

  factory :transaction1, class: Transaction do
    todo 0
    amount 2
    price 34
    date Date.today
  end
end