FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }
    size 3
    completed_at nil
    project

    trait :small do
      size 1
    end

    trait :large do
      size 5
    end

    trait :soon do
      due_date { 1.day.from_now }
    end

    trait :later do
      due_date { 1.month.from_now }
    end

    trait :newly_complete do
      completed_at { 1.day.ago }
    end

    trait :long_complete do
      completed_at { 6.months.ago }
    end

    # factory :trivial, class: Task, trait: %i[small later]
    factory :trivial do
      small
      later
    end

    # factory :panic, class: Task, trait: %i[large soon]
    factory :panic do
      large
      soon
    end
  end
end
