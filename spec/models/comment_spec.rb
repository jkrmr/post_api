require 'rails_helper'

describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:commentable_id) }
  it { is_expected.to validate_presence_of(:commentable_type) }
  it { is_expected.to belong_to(:author) }
  it { is_expected.to belong_to(:commentable) }

  describe '#make_child_of' do
    it 'sets the receiver to be a child of the sender' do
      parent = create(:comment)
      child_comment = create(:comment)

      child_comment.make_child_of(id: parent.id)

      expect(child_comment.ancestry.to_i).to eq parent.id
    end
  end
end
