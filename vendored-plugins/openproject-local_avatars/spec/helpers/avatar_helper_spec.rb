require 'spec_helper'

describe AvatarHelper, :type => :helper do
  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:avatar_stub) { FactoryGirl.build_stubbed(:avatar_attachment) }

  before do
    allow(GravatarImageTag.configuration).to receive(:secure).and_return(false)
    allow(user).to receive(:local_avatar_attachment).and_return avatar_stub
  end

  def expected_image_tag(user)
    tag_options = { title: user.name,
                    alt: 'Avatar',
                    class: 'avatar' }

    image_tag expected_url(user), tag_options
  end

  def expected_url(user)
    users_dump_avatar_url(user)
  end

  def expected_gravatar_url(user)
    digest = Digest::MD5.hexdigest(user.mail)
    host = "http://gravatar.com"

    "#{host}/avatar/#{digest}?secure=false"
  end

  def expected_gravatar_image_tag(user)
    tag_options = { title: user.name,
                    alt: 'Gravatar',
                    class: 'avatar' }

    image_tag expected_gravatar_url(user), tag_options
  end

  describe '#avatar' do
    it "should return the image attached to the user" do
      with_settings gravatar_enabled: '1' do
        expect(helper.avatar(user)).to be_html_eql(expected_image_tag(user))
      end
    end

    it "should return the gravatar image if no image uploaded for the user" do
      allow(user).to receive(:local_avatar_attachment).and_return nil

      with_settings gravatar_enabled: '1' do
        expect(helper.avatar(user)).to be_html_eql(expected_gravatar_image_tag(user))
      end
    end

    it "should return blank if image attached to the user but gravatars disabled" do
      with_settings gravatar_enabled: '0' do
        expect(helper.avatar(user)).to be_blank
      end
    end
  end

  describe '#avatar_url' do
    it "should return the url to the image attached to the user" do
      with_settings gravatar_enabled: '1' do
        expect(helper.avatar_url(user)).to eq(expected_url(user))
      end
    end

    it "should return the gravatar url if no image uploaded for the user" do
      allow(user).to receive(:local_avatar_attachment).and_return nil

      with_settings gravatar_enabled: '1' do
        expect(helper.avatar_url(user)).to eq(expected_gravatar_url(user))
      end
    end

    it "should return blank if image attached to the user but gravatars disabled" do
      with_settings gravatar_enabled: '0' do
        expect(helper.avatar_url(user)).to be_blank
      end
    end
  end
end
