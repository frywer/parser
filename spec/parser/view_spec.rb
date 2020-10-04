# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Parser::View do
  let(:valid_row) { described_class.new('/help_page/1 382.335.626.855') }
  let(:invalid_row) { described_class.new('/help_page 1 335.626.855') }

  describe '#page' do
    context 'when row is valid' do
      it 'returns page path' do
        expect(valid_row.page).to eq '/help_page/1'
      end
    end

    context 'when row is invalid' do
      it 'returns raise InvalidRow' do
        expect(invalid_row.page).to be_nil
      end
    end
  end

  describe '#ip_address' do
    context 'when row is valid' do
      it 'returns ip address' do
        expect(valid_row.ip_address).to eq '382.335.626.855'
      end
    end

    context 'when row is invalid' do
      it 'returns raise InvalidRow' do
        expect(invalid_row.ip_address).to be_nil
      end
    end
  end

  describe '#validate!' do
    context 'when row is valid' do
      it 'returns true' do
        expect { valid_row.validate! }.not_to raise_error
      end
    end

    context 'when row is invalid' do
      it 'returns raise InvalidRow' do
        expect { invalid_row.validate! }.to raise_error(Parser::View::InvalidRow)
      end
    end
  end
end
