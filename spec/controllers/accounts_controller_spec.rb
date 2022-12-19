require 'rails_helper'
require 'spec_helper'

describe AccountsController do

    describe 'test login' do
        it 'should call login method' do
            get :login
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'test create_login' do
        let!(:account1) {FactoryBot.create(:account)}
        it 'should return if user does not exist' do
            user1={:email =>'123@gmail.com'}
            password1='12345678'
            post :create_login,:user=>user1, :password=>password1
            expect(flash[:notice]).to eq( "User does not exist, please sign in!")
        end

        it 'should return login successfully with correct email and password' do
            account=double()
            allow(account).to receive(:email).and_return(:account1)
            user1={:email =>'Test'}
            password1='Test'
            post :create_login,:user=>user1, :password=>password1
            expect(flash[:notice]).to eq(  "Login successfully!")
        end

        it 'should return Invalid user or password with incorrect email or password' do
            account=double()
            allow(account).to receive(:email).and_return(:account1)
            user1={:email =>'Test'}
            password1='Wrong password'
            post :create_login,:user=>user1, :password=>password1
            expect(flash[:notice]).to eq( "Invalid user or password!")
        end
    end

    describe 'test log out' do
        it 'should call logout method' do
            delete :logout
            expect(response).to have_http_status(:found)
        end
    end

    describe 'test sign up' do
        it 'should call signup method' do
            get :signup
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'test create_account' do
        let!(:account1) {FactoryBot.create(:account)}
        it 'should return signup successfully if user does not exist' do
            user1={:name => '123', :email =>'123@gmail.com'}
            password1='12345678'
            post :create_account,:user=>user1, :password=>password1
            expect(flash[:notice]).to eq( "Signup successfully!")
        end

        it 'should return login successfully with valid email and password' do
            user1={:name => '123', :email =>'123@gmail.com'}
            password1='12345678'
            post :create_account,:user=>user1, :password=>password1
            expect(flash[:notice]).to eq( "Signup successfully!")
            post :create_login,:user=>user1, :password=>password1
            expect(flash[:notice]).to eq(  "Login successfully!")
        end

    end

end
