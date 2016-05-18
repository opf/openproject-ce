require 'spec_helper'

describe AnnouncementsController, :type => :controller do
  before(:each) do
    allow(@controller).to receive(:check_if_login_required)
    expect(@controller).to receive(:require_admin)

    @announcement = mock_model Announcement
    allow(Announcement).to receive(:only_one).and_return(@announcement)
    disable_flash_sweep
  end

  describe '#get' do
    before :each do

    end

    describe '#edit' do
      before :each do
        @params = {}
      end

      describe "SUCCESS" do
        describe "html" do
          before :each do
            get :edit, @params
          end

          it{expect(assigns(:announcement)).to eql @announcement}
          it{expect(response).to be_success}
        end
      end
    end
  end

  describe '#put' do
    before :each do
    end

    describe '#update' do
      before :each do
        @params = {"announcement" => {"until_date" => "2011-01-11",
                                      "text" => "announcement!!!",
                                      "active" => "1"}}
      end

      describe "SUCCESS" do
        before :each do
          expect(@announcement).to receive(:attributes=)
          expect(@announcement).to receive(:save).and_return(true)
        end

        describe "html" do
          before :each do
            put :update, @params
          end

          it{expect(assigns(:announcement)).to eql @announcement}
          it{expect(response).to render_template 'edit'}
          it{expect(flash[:notice]).to eql I18n.t(:notice_successful_update)}
        end
      end
    end
  end
end
