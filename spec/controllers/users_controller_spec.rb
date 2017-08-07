require 'rails_helper'

describe UsersController do
  describe "GET #show" do
    it "returns a success response" do
      user = FactoryGirl.create(:user)
      get :show, params: { id: user.id }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #edit" do
  #   it "returns a success response" do
  #     uuser = FactoryGirl.create(:user)
  #     get :edit, params: { id: user.id }, session: valid_session
  #     expect(response).to have_http_status(:success)
  #   end
  # end

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

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested user" do
  #       user = User.create! valid_attributes
  #       put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
  #       user.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the user" do
  #       user = User.create! valid_attributes
  #       put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(user)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       user = User.create! valid_attributes
  #       put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested user" do
  #     user = User.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: user.to_param}, session: valid_session
  #     }.to change(User, :count).by(-1)
  #   end

  #   it "redirects to the users list" do
  #     user = User.create! valid_attributes
  #     delete :destroy, params: {id: user.to_param}, session: valid_session
  #     expect(response).to redirect_to(users_url)
  #   end
  # end

end
