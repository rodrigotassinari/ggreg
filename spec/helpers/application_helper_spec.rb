require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#title' do
    it 'returns the default title' do
      expect(helper.title).to eq('GGreg')
    end
  end

end
