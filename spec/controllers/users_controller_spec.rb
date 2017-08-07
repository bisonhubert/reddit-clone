require 'rails_helper'

describe UsersController do
  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {
            user: {
              username: 'testuser',
              email: 'test@test.com',
              password: 'test1234%',
              password_confirmation: 'test1234%'
            }
          }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post :create, params: {
          user: {
            username: 'testuser',
            email: 'test@test.com',
            password: 'test1234%',
            password_confirmation: 'test1234%'
          }
        }
        expect(response).to redirect_to((User.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {
          user: {
            username: 'testuser',
            email: 'test@test.com'
          }
        }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
