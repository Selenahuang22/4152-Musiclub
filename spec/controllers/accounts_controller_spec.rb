require 'rails_helper'
require 'spec_helper'

describe AccountsController do

    describe 'test login' do
        it 'should call login method' do
            get :login
            expect(response).to have_http_status(:ok)
        end
    end

end