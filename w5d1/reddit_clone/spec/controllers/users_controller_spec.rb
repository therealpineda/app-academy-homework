require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'validates the presence of username and password' do
        post :create, user: { username: 'user123' }
        expect(response).to render_template("new")
        expect(flash[:errors]).not_to be_empty
      end

      it 'validates that the password is at least 6 characters long' do
        post :create, user: { username: 'user123', password: "12345" }
        expect(response).to render_template("new")
        expect(flash[:errors].join("")).to include("Password")
      end
    end

    context 'with valid parameters' do
      it 'redirects the user to subs index on success' do
        post :create, user: { username: 'user123', password: "123456" }
        expect(response).to redirect_to(subs_url)
      end
    end
  end
end
