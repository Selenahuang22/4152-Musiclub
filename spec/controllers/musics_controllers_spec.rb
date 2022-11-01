require 'rails_helper'
require 'spec_helper'

describe MusicsController do
    describe 'test show' do
        it 'should call show method' do
            music1=Music.create!(:title => 'M1', :category => 'C1' )
            get :show, :id=>music1.id
            expect(assigns(:music)).to eql(music1)
            expect(response).to render_template('show')
        end
    end

    # describe 'test index' do
    #     it 'should call index method' do




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
        it 'should call edit method' do
            music1=Music.create!(:title => 'M1', :category => 'C1' )
            get :edit, :id=>music1.id
            expect(assigns(:music)).to eql(music1)
            expect(response).to render_template('edit')
        end
    end

    describe 'test update' do
        it 'should call update method' do
            music1=Music.create!(:title => 'M1', :category => 'C1' )
            put :update, :id=>music1.id,:music=>music1.attributes={:title => 'M2'}
            expect(flash[:notice]).to eq("M2 was successfully updated.")
            expect(response).to redirect_to(music_path(music1))
        end
    end
            

    describe 'test destroy' do
        it 'should call destroy method' do
          music1=Music.create!(:title => 'M1', :category => 'C1', :id => 1)
          delete :destroy, :id => music1.id
          expect(flash[:notice]).to eq("Music 'M1' deleted.")
          expect(response).to redirect_to(musics_path)
        end
    end

end