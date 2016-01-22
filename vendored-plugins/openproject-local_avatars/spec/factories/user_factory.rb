FactoryGirl.modify do
  factory :user do
    after(:create) do |user|
      user.password = nil
    end
  end
end
