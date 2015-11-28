require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	
	let(:valid_session) {{user_id: 1}}

	describe "GET index" do
		it "assigns all users as @users" do
			user = create(:user)
			get :index, {}, valid_session
			expect(assigns(:users)).to eq([user])
		end
	end

	describe "GET show" do
		it "assigns the requested user as @user" do
			user = create(:user)
			get :show, {id: 1}, valid_session
			expect(assigns(:user)).to eq(user)
		end
	end

	describe "GET new" do
		it "assigns a new user as @user" do
			get :new, {}
			expect(assigns(:user)).to be_an_instance_of(User)
		end
	end

	describe "DELETE destroy" do
		it "destroys the requested user" do
			user = create(:user)
			delete :destroy, {id: 1}, valid_session
			expect(User.all).to eq([])
		end

		it "redirects to the user list" do
			user = create(:user)
			delete :destroy, {id: 1}, valid_session
			expect(response).to redirect_to users_path
		end
	end

	describe "POST create" do
		it "check that @user is assigned" do
			post :create, {user: attributes_for(:user)}, valid_session
			expect(assigns(:user)).to be_an_instance_of(User)
		end

		it "check that @user is saved to db" do
			post :create, {user: attributes_for(:user)}, valid_session
			expect(User.all.count).to eq(1)
		end

		it "check that page is redirected to login" do
			post :create, {user: attributes_for(:user)}, valid_session
			expect(response).to redirect_to login_path
		end
	end


end




