require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../shared_examples')

describe UsersController, :type => :controller do
  include_examples "a controller with avatar features"

  describe "GET /users/:id/dump_avatar" do
    let(:user) { user_with_avatar }
    let(:action) { get :dump_avatar, :id => user.id }
    let(:redirect_path) { users_dump_avatar_url(:id => user.id) }
    it_should_behave_like "an action checked for required login"

    context "for an invalid user" do
      let(:do_action) { get :dump_avatar, :id => 0}
      it_should_behave_like "an action with an invalid user"
    end
    #
    context "for a user without an avatar" do
      let(:user) { user_without_avatar }
      it_should_behave_like "an action with stubbed User.find"
      let(:do_action) { get :dump_avatar, :id => user.id}
      it_should_behave_like "an action with an invalid user"
    end
    #
    context "for a user with an avatar" do
      let(:user) { user_with_avatar }
      it_should_behave_like "an action with stubbed User.find"
      let(:do_action) { get :dump_avatar, :id => user.id }
      it { do_action; expect(response).to be_success }
      #again, we have to use the nasty trick to catch the default rails render
      it { expect(@controller).to receive(:send_file).and_return true; expect(@controller).to receive(:render); do_action }
    end
  end

  describe "POST /users/:id/update_avatar" do
    let(:user) { user_with_avatar }
    let(:action) { post :update_avatar, :avatar => avatar_file, :id => user.id }
    let(:redirect_path) { users_update_avatar_url(:id => user.id) }
    let(:successful_response) do
      expect(response).to redirect_to({ controller: 'users',
                                        action: 'edit',
                                        id: user.id,
                                        tab: 'avatar'} )
    end
    it_should_behave_like "an action requiring admin"

    let(:current) { FactoryGirl.create(:admin)}

    before do
      allow(User).to receive(:current).and_return(current)
    end

    context "WHEN save submit" do
      let(:submit_param) { {:commit => :button_save, :avatar => avatar_file} }
      context "for an invalid user" do
        let(:do_action) { post :update_avatar, submit_param.merge(:id => 0)}
        it_should_behave_like "an action with an invalid user"
        specify { expect(Attachment).not_to receive(:attach_files); do_action }
        it { do_action; expect(flash[:notice]).to be_blank }
      end

      context "for a user without an avatar" do
        let(:user) { user_without_avatar }
        it_should_behave_like "an action with stubbed User.find"
        let(:do_action) { post :update_avatar, submit_param.merge(:id => user.id)}
        it { do_action; expect(response).to be_redirect }
        it { do_action; is_expected.to redirect_to tab_edit_user_path(user.id, tab: 'avatar') }
        specify { expect(Attachment).to receive(:attach_files); do_action }
        it { do_action; expect(flash[:notice]).to include "changed" }
      end

      context "for a user with an avatar" do
        let(:user) { user_with_avatar }
        it_should_behave_like "an action with stubbed User.find"
        let(:do_action) { post :update_avatar, submit_param.merge(:id => user.id)}
        it { do_action; expect(response).to be_redirect }
        it { do_action; is_expected.to redirect_to tab_edit_user_path(user.id, tab: 'avatar') }
        it_should_behave_like "an action that deletes the user's avatar"
        specify { expect(Attachment).to receive(:attach_files); do_action }
        it { do_action; expect(flash[:notice]).to include "changed" }
      end
    end

    describe "WHEN delete submit" do
      let(:submit_param) { {:delete => :true} }
      context "for an invalid user" do
        let(:do_action) { post :update_avatar, submit_param.merge(:id => 0)}
        it_should_behave_like "an action with an invalid user"
        specify { expect(Attachment).not_to receive(:attach_files); do_action }
        it { do_action; expect(flash[:notice]).to be_blank }
      end

      context "for a user without an avatar" do
        let(:user) { user_without_avatar }
        it_should_behave_like "an action with stubbed User.find"
        let(:do_action) { post :update_avatar, submit_param.merge(:id => user.id)}
        it { do_action; expect(response).to be_redirect }
        it { do_action; is_expected.to redirect_to tab_edit_user_path(user.id, tab: 'avatar') }
        specify { expect(Attachment).not_to receive(:attach_files); do_action }
        it { do_action; expect(flash[:error]).to include "could not be deleted" }
        it { do_action; expect(user.local_avatar_attachment).to be_blank}
      end

      context "for a user with an avatar" do
        let(:user) { user_with_avatar }
        it_should_behave_like "an action with stubbed User.find"
        let(:do_action) { post :update_avatar, submit_param.merge(:id => user.id)}
        it { do_action; expect(response).to be_redirect }
        it { do_action; is_expected.to redirect_to tab_edit_user_path(user.id, tab: 'avatar') }
        it_should_behave_like "an action that deletes the user's avatar"
        specify { expect(Attachment).not_to receive(:attach_files); do_action }
        it { do_action; expect(flash[:notice]).to include "deleted successfully" }
        it { do_action; expect(user.local_avatar_attachment).to be_blank}
      end
    end
  end
end
