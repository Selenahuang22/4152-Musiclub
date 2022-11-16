require 'rails_helper'
require 'spec_helper'

describe PaymentController do

    describe 'test index' do
        let!(:music1) { FactoryBot.create(:music,:title=>'M1') }
        it 'should call index method' do
            controller.instance_variable_set(:@music, music1)
            get :index, :format=>music1.id
            expect(response).to have_http_status(:ok)
        end
    end

    describe 'test create_payment' do
        let!(:music1) { FactoryBot.create(:music,:id=>'1', :title=>'M1') }
        let!(:current_user1) {FactoryBot.create(:account)}
        it 'should call create_payment method' do
            controller.instance_variable_set(:@music, music1)
            controller.instance_variable_set(:@current_user, current_user1)
            payment={:card_number =>'1111222233334444', :expiration_date=>'01/2027',:cvv=>'222', :holder_name=>'Alice'}
            post :create_payment,:format=>music1.id, :payment=>payment
            expect(flash[:notice]).to eq("M1 has been downloaded to your download library")

        end
    end

end