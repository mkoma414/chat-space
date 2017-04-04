require 'rails_helper'

describe MessagesController do
  describe 'GET #index' do
    it "assigns the requested grouops to @groups" do
      user = create(:user)
      sign_in user
      get :index, params: { group_id: user.groups[0].id }
      expect(assigns(:groups)).to eq user.groups
    end

    it "assigns the requested current_grouops to @current_groups" do
      user = create(:user)
      sign_in user
      get :index, params: { group_id: user.groups[0].id }
      expect(assigns(:current_group)).to eq user.groups[0]
    end

    it "renders the :index template" do
      user = create(:user)
      sign_in user
      get :index, params: { group_id: user.groups[0].id }
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "assigns the requested message to message" do
      user = create(:user)
      sign_in user
      post :create, group_id: user.groups[0].id, params: {message: {body: user.groups[0].messages[0].body}, group_id: user.groups[0].id }
      expect(assigns(:message).body).to eq user.groups[0].messages[0].body
    end

    it "renders the :create template" do
      user = create(:user)
      sign_in user
      post :create, group_id: user.groups[0].id, params: {message: {body: user.groups[0].messages[0].body}, group_id: user.groups[0].id }
      expect(response).to render_template :create
    end
  end
end