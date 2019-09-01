require 'rails_helper'

describe LogsController do
  
  let(:user)  { create(:user) }

  describe 'GET #index' do

    context 'ログイン' do
      before do
        login user
        get :index
      end

      it "期待したインスタンスか" do
        logs = create_list(:log, 3)
        expect(assigns(:logs)).to match(logs)
      end

      it "indexページに遷移するか" do
        expect(response).to render_template :index
      end
    end

  end

  describe 'GET #new' do
    it "newページに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:params) { { user_id: user.id, log: attributes_for(:log) } }

    context 'ログイン' do
      before do
        login user
      end

      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it 'ログが一つ増える' do
          expect{ subject }.to change(Log, :count).by(1)
        end

        it 'root_pathに遷移するか' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

    end
  end
  
  describe 'GET #edit' do
  it "期待したインスタンスか" do
    log = create(:log)
      get :edit, params: { id: log }
      expect(assigns(:log)).to eq log
    end

    it "editページに遷移するか" do
      log = create(:log)
      get :edit, params: { id: log }
      expect(response).to render_template :edit
    end
  end
  
end