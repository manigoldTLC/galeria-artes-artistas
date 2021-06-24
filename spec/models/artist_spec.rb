require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validates' do
    context 'check if name not is nil' do
      it { expect(build(:artist, name: nil)).to be_invalid }
    end
  end

  describe 'factory' do
    context 'when using standard user factory' do
      it { expect(build(:artist)).to be_valid }
    end
  end
end
