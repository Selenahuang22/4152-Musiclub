class Account < ApplicationRecord

    has_many :musics, dependent: :destroy
    has_many :libraries
    has_many :favorite_carts

    has_many :musics_download, through: :libraries, source: :music
    has_many :musics_favorite, through: :favorite_carts, source: :music

end
