require 'rails_helper'

RSpec.describe TwitterIntegration, type: :model do

  it 'requires a valid configuration' do
    expect(subject).to_not be_valid
    expect(subject.errors[:configuration]).to_not be_empty
    expect(subject.errors[:consumer_key]).to_not be_empty
    expect(FactoryGirl.build(:twitter_integration)).to be_valid
  end

  it 'allows direct access to the configuration attributes' do
    ti = FactoryGirl.build(:twitter_integration)
    expect(ti.configuration['consumer_key']).to eql('ck')
    expect(ti.consumer_key).to eql('ck')
    ti.consumer_key = 'new_ck'
    expect(ti.configuration['consumer_key']).to eql('new_ck')
    expect(ti.consumer_key).to eql('new_ck')
  end

end
