require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'presence validates' do
    context 'check name and description, if empty, return invalid' do
      it { expect(build(:artist, name: nil, description: nil)).to be_invalid }
    end

    context 'check when one of the fields is filled, in this case the name field' do
      it { expect(build(:artist, name: 'Artist name', description: nil)).to be_invalid }
    end

    context 'check when one of the fields is filled, in this case the description field' do
      it { expect(build(:artist, name: nil, description: 'here contains a description')).to be_invalid }
    end
  end

  describe 'factory' do
    context 'when using standard artist factory' do
      it { expect(build(:artist)).to be_valid }
    end
  end
end
