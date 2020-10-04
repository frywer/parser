# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Parser::Page do
  let(:views) do
    [Parser::View.new('/about 802.683.925.780'),
     Parser::View.new('/about 802.683.925.780'),
     Parser::View.new('/about 336.284.013.698')]
  end

  let(:page) { described_class.new('/about', views) }

  describe '#uniq_views' do
    it 'returns uniq views views' do
      expect(page.uniq_views.map(&:ip_address)).to match_array ['802.683.925.780', '336.284.013.698']
    end
  end

  describe '#uniq_count' do
    it 'returns uniq views uniq count' do
      expect(page.uniq_count).to eq 2
    end
  end

  describe '#count' do
    it 'returns uniq views uniq count' do
      expect(page.count).to eq 3
    end
  end
end
