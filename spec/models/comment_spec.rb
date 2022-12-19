require 'rails_helper'
require 'spec_helper'


describe Comment do
  describe 'test self.with_music' do
    let!(:comment1) { FactoryBot.create(:comment,music_id:'1') }
      it 'should return comments' do
        Comment.instance_variable_set(:@comments, comment1)
        expect(Comment.with_music('1')).to match([:author=>'Default', :content=>"Comment Content"])
      end
  end
end
