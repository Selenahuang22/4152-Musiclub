class Music < ApplicationRecord

  has_many :libraries
  has_many :favorite_carts
  has_many :order_details
  has_many :comments

  has_many :dl_musics, through: :libraries, source: :account
  has_many :fv_musics, through: :libraries, source: :account
  has_many :od_musics, through: :libraries, source: :account


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

  def self.search_by(input)
    if input.nil?||input.empty?
      result_list=nil
    else
      result_list=[]
      music_all=Music.all
      music_all.each do |c|
        t_title=c.title
        if t_title.downcase.include?(input.downcase)
          result_list.append(t_title)
        end
      end
    end
    return result_list
  end
end
