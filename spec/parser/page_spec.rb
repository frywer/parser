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
    it 'returns uniq views count' do
      expect(page.uniq_views.count).to eq 2
    end
  end
end
