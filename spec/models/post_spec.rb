require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to belong_to(:author) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:images) }

  describe '#archive' do
    it 'sets a post to being archived' do
      post = create(:post)

      post.archive

      expect(post.archived?).to eq true
    end
  end

  describe '#comments_thread' do
    it 'returns JSON' do
      post = create(:post_with_comment)

      thread = post.comments_thread

      expect(json(thread)).to be_an Array
    end
  end
end
