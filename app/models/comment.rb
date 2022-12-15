class Comment < ApplicationRecord

    belongs_to :music
    belongs_to :account

    def self.with_music(music_id)
        @comments = Comment.where("music_id=#{music_id}").to_a
        @comments_content = []

        @comments.each do |c|
            @comments_content << {
                :content => c["content"],
                :author => Account.find_by_id(c["account_id"]).name
            }
        end
        return @comments_content
    end
    

end
