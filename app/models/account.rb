class Account < ApplicationRecord

    has_many :musics, dependent: :destroy
    has_many :libraries
    has_many :favorite_carts
    has_many :order_details

    has_many :musics_download, through: :libraries, source: :music
    has_many :musics_favorite, through: :favorite_carts, source: :music
    has_many :musics_ordered, through: :order_details, source: :music

end
