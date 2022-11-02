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

    # describe 'test index' do
    #     it 'should call index method' do
    #         get :index
    #         (assigns(:all_categories)).to eql([])
    #     end
    # end


    describe 'test create' do
        it 'should call create method' do
            music1={:title => 'M1'}
            post :create, :music => music1
            expect(flash[:notice]).to eq("M1 was successfully created.")
            expect(response).to redirect_to(musics_path)
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
end