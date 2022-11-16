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

  Given /I am the admin/ do
    @current_user = Account.create!(
      name: "Admin",
      email: "admin@musiclub.com",
      password: "Admin",
      admin: false
    )
  end
  
 
  