class Music < ActiveRecord::Base

  def self.all_categories
    ['rock', 'country', 'pop', 'blues', 'classical', 'jazz']
  end

  def self.with_categories(categories, sort_by)
    if categories.nil?
      # puts 1
      all.order sort_by
    else
      # puts 2
      Music.where(category: categories.map(&:downcase)).order sort_by
    end
  end

end
