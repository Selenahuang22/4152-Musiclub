Given /the following account exist/ do |table|
    table.hashes.each do |account|
      Account.create!(
        name: account[:name], 
        email: account[:email], 
        password: account[:password],
        admin: account[:admin]
      )
    end
  end
  
 
  