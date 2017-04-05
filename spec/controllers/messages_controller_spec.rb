require 'rails_helper'

describe MessagesController do
  let(:user){create(:user)}
  before do
    sign_in user
  end
  describe 'GET #index' do
    it "assigns the requested grouops to @groups" do
      get :index, params: { group_id: user.groups[0].id }
      expect(assigns(:groups)).to eq user.groups
    end

    it "assigns the requested current_grouops to @current_groups" do
      get :index, params: { group_id: user.groups[0].id }
      expect(assigns(:current_group)).to eq user.groups[0]
    end

    it "renders the :index template" do
      get :index, params: { group_id: user.groups[0].id }
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "assigns the requested message to message" do
      post :create, group_id: user.groups[0].id, params: {message: {body: user.groups[0].messages[0].body}, group_id: user.groups[0].id }
      expect(assigns(:message).body).to eq user.groups[0].messages[0].body
    end

    it "renders the :create template" do
      post :create, group_id: user.groups[0].id, params: {message: {body: user.groups[0].messages[0].body}, group_id: user.groups[0].id }
      expect(response).to render_template :create
    end
  end
end