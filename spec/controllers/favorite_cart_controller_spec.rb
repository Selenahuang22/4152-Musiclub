require 'rails_helper'
require 'spec_helper'

describe FavoriteCartController do
    describe 'test index' do
        let!(:current_user1) {FactoryBot.create(:account)}
        it 'should response 200 when current user is not nil' do
            controller.instance_variable_set(:@current_user, current_user1)
            get :index
            expect(response).to have_http_status(:ok)
        end
        it 'should redirect when current user is nil' do
            # controller.instance_variable_set(:@current_user, current_user1)
            get :index
            expect(response).to redirect_to(login_path)
        end
    end
end