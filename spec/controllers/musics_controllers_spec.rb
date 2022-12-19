require 'rails_helper'
require 'spec_helper'

describe MusicsController do
    describe 'test show' do
        let!(:music1) { FactoryBot.create(:music) }
        it 'should call show method' do
            get :show, :id=>music1.id
            expect(assigns(:music)).to eql(music1)
            expect(response).to render_template('show')
        end
    end

    describe 'test index' do
        it 'should call index method' do
            music1=Music.create!(:title=>'M1')
            get :index,{},{ search_res: music1.title }
            expect(response).to have_http_status(:found)
        end
    end

    describe 'test search' do
        it 'should call search method' do
            music1=Music.create!(:title=>'M1')
            get :search, :search=>'M1'
            expect(response).to have_http_status(:found)
        end
    end

    describe 'test create' do
        it 'should call create method successfully' do
            music1={:title => 'M1'}
            post :create, :music => music1
            expect(flash[:notice]).to eq("M1 was successfully created.")
            expect(response).to redirect_to(musics_path)
        end
        
        it 'should call create method but create faild' do
            music2={:title =>'',:description=>'',:singer=>''}
            post :create, :music=>music2
            expect(flash[:notice]).to eq("One or more information of the new song weren't filled, creation failed")
        end
    end 

    describe 'test edit' do
        let!(:music1) { FactoryBot.create(:music) }
        it 'should call edit method' do
            get :edit, :id=>music1.id
            expect(assigns(:music)).to eql(music1)
            expect(response).to render_template('edit')
        end
    end

    describe 'test update' do
        let!(:music1) { FactoryBot.create(:music) }
        it 'should call update method' do
            put :update, :id=>music1.id,:music=>music1.attributes={:title => 'Modified'}
            expect(flash[:notice]).to eq("Modified was successfully updated.")
            expect(response).to redirect_to(music_path(music1))
        end
    end
            

    describe 'test destroy' do
        let!(:music1) { FactoryBot.create(:music,:title=>'M1') }
        it 'should call destroy method' do
          delete :destroy, :id => music1.id
          expect(flash[:notice]).to eq("Music 'M1' deleted.")
          expect(response).to redirect_to(musics_path)
        end
    end

    describe 'test download' do
        let!(:music1) { FactoryBot.create(:music,:title=>'M1') }
        let!(:current_user1) {FactoryBot.create(:account)}
        it 'should call download method' do
            controller.instance_variable_set(:@current_user, current_user1)
            get :download,:format=>music1.id
            expect(flash[:notice]).to eq("M1 has been downloaded to your download library")
        end
    end

    describe 'test download_remove' do
        let!(:music1) { FactoryBot.create(:music,:title=>'M1') }
        let!(:current_user1) {FactoryBot.create(:account)}
        it 'should call download method' do
            controller.instance_variable_set(:@current_user, current_user1)
            get :download_remove,:format=>music1.id
            expect(flash[:notice]).to eq("M1 has been removed from your downloading library")
        end
    end

    describe 'test favorite' do
        let!(:music1) { FactoryBot.create(:music,:title=>'M1') }
        let!(:current_user1) {FactoryBot.create(:account)}
        it 'should call download method' do
            controller.instance_variable_set(:@current_user, current_user1)
            get :favorite,:format=>music1.id
            expect(flash[:notice]).to eq("M1 has been added to your favorite")
        end
    end

    describe 'test download_remove' do
        let!(:music1) { FactoryBot.create(:music,:title=>'M1') }
        let!(:current_user1) {FactoryBot.create(:account)}
        it 'should call download method' do
            controller.instance_variable_set(:@current_user, current_user1)
            get :favorite_remove,:format=>music1.id
            expect(flash[:notice]).to eq("M1 has been removed from your favorite")
        end
    end
end