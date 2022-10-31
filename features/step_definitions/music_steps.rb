# Add a declarative step here for populating the DB with movies.

Given /the following music exist/ do |table|
  table.hashes.each do |music|
    Music.create!(
      title: music[:title], 
      category: music[:category], 
      release_date: music[:release_date],
      singer: music[:singer]
    )
  end
end

Then /^(?:|I ) (should )?view the details of "(.*)"/ do |music_title|
  When %{I follow "More about #{music_title}"}
  # click_link("More about #{music_title}")
end

Then /(.*) seed music should exist/ do | n_seeds |
  expect(Music.count).to eq n_seeds.to_i
end


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  expect(page.body.index(e1)).to be < page.body.index(e2)
end

When /I (un)?check the following categories: (.*)/ do |uncheck, category_list|

  category_list.split(', ').each do |category|
    if uncheck
      uncheck("categories[#{category}]")
    else
      check("categories[#{category}]")
    end
  end
end


Then /^I should (not )?see the following music: (.*)$/ do |no, music_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  music_list.split(', ').each do |music|
    if no
      expect(page).not_to have_content(music)
    else
      expect(page).to have_content(music)
    end
  end
end

Then /I should see all the music/ do
  # Make sure that all the movies in the app are visible in the table
  expect(page).to have_selector('tbody tr', count: Music.count)
  
end

### Utility Steps Just for this assignment.

Then /^debug$/ do
  # Use this to write "Then debug" in your scenario to open a console.
   require "byebug"; byebug
  1 # intentionally force debugger context in this method
end

Then /^debug javascript$/ do
  # Use this to write "Then debug" in your scenario to open a JS console
  page.driver.debugger
  1
end


Then /complete the rest of of this scenario/ do
  # This shows you what a basic cucumber scenario looks like.
  # You should leave this block inside movie_steps, but replace
  # the line in your scenarios with the appropriate steps.
  fail "Remove this step from your .feature files"
end
