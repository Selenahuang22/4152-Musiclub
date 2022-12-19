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
