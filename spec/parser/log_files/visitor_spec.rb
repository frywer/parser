# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Parser::LogFiles::Visitor do
  let(:views) do
    [Parser::View.new('/about 802.683.925.780'),
     Parser::View.new('/home 802.683.925.780'),
     Parser::View.new('/about/2 802.683.925.780')]
  end

  let(:visitor) { described_class.new('802.683.925.780', views) }

  describe '#activities_count' do
    it 'returns count activities' do
      expect(visitor.count).to eq 3
    end
  end
end
