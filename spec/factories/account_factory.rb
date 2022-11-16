FactoryBot.define do
    factory :account do
      name {'Test User'}
      email {'Test Email'}
      password {'Test Password'}
      admin {false}
    end


  end