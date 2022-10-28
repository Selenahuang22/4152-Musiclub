class Music < ActiveRecord::Base

  def self.all_categories
    ['Rock', 'Country', 'Pop', 'Blues', 'Classical', 'Jazz']
  end

  def self.with_categories(categories, sort_by)
      all.order sort_by
  end
  
end
