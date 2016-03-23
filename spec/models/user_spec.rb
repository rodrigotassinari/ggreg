require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    context 'on creation' do
      subject { build(:user, email: 'foo@bar.com') }
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive.allow_blank }
    end
    it { is_expected.to allow_value('foo@bar.com').for(:email) }
    it { is_expected.to allow_value('foo+spam@bar.com').for(:email) }
    it { is_expected.to_not allow_value('foo.bar.com').for(:email) }
    it { is_expected.to_not allow_value('foo@').for(:email) }
    context 'on creation' do
      subject { build(:user, password: nil, password_confirmation: nil) }
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_confirmation_of(:password) }
    end
  end

  describe '#email=' do
    subject { described_class.new }
    it 'sets the email always downcased' do
      expect(subject.email).to be_nil

      subject.email = 'Foo@Bar.cOm'
      expect(subject.email).to eql('foo@bar.com')

      subject.assign_attributes(email: 'LaLa@LuLu.org')
      expect(subject.email).to eql('lala@lulu.org')

      expect(subject.attributes['email']).to eql('lala@lulu.org')

      expect(described_class.new(email: 'Ops@Ips.net').email).to eql('ops@ips.net')
    end
    it 'sets the email as nil or blank' do
      subject.email = 'Foo@Bar.cOm'
      expect(subject.email).to eql('foo@bar.com')

      subject.email = nil
      expect(subject.email).to be_nil

      subject.email = ''
      expect(subject.email).to eql('')
    end
  end

end
