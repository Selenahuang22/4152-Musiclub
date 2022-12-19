require 'rails_helper'
require 'spec_helper'

describe CommentController do
    describe 'test index' do
        it 'should call index method' do
            music1=Music.create!(:title=>'M1')
            get :index, :format=>music1.id
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'test add_comment' do
        let!(:current_user1) {FactoryBot.create(:account)}
        it 'should call add_comment method' do
            music1=Music.create!(:title=>'M1')
            controller.instance_variable_set(:@music, nil) 
            controller.instance_variable_set(:@current_user, current_user1)
            post :add_comment,{"comment" => { "content" => "test"}} ,{ music_id: music1.id }
            expect(response).to have_http_status(:found)
        end
    end

    describe 'test manage' do
        let!(:comment1) {FactoryBot.create(:comment)}
        it 'should call manage method' do
            get :manage
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'test destroy' do
        let!(:comment1) {FactoryBot.create(:comment,:music_id=>'1')}
        it 'should call destroy method' do
            get :destroy, :format=>comment1.music_id
            expect(flash[:notice]).to eq("Comment 'Comment Content' removed.")
            expect(response).to have_http_status(:found)
        end
    end
end