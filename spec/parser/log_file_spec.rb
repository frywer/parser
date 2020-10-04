# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Parser::LogFile do
  let(:log_file) do
    described_class.new('/path')
  end

  let(:log_file_rows) do
    ["/about 802.683.925.780\n",
     "/about/2 543.910.244.929\n"]
  end

  before do
    allow(File).to receive(:readlines).and_return(log_file_rows)
  end

  describe '#parse' do
    context 'when all rows are valid' do
      it 'returns Rows' do
        log_file.parse
        expect(log_file.views.count).to eq 2
      end
    end

    context 'when some rows are invalid' do
      let(:log_file_rows) do
        ["/about 802.683.925.780\n",
         "/about/2\n"]
      end

      it 'returns Rows' do
        log_file.parse
        expect(log_file.views.count).to eq 1
        expect(log_file.errors).to eq ["Invalid row: /about/2\n"]
      end
    end
  end

  describe '#parse!' do
    context 'when file exist' do
      it 'return true' do
        allow(File).to receive(:exist?).and_return(true)

        expect { log_file.parse! }.not_to raise_error
      end
    end

    context 'when file missing' do
      it 'return raise FileMissing' do
        expect { log_file.parse! }.to raise_error(Parser::LogFile::FileMissing)
      end
    end
  end

  describe '#pages' do
    let(:log_file_rows) do
      ["/about 802.683.925.780\n",
       "/about 802.683.925.780\n",
       "/about/2 543.910.244.929\n",
       "/about 543.910.244.929\n"]
    end

    it 'returns pages count' do
      log_file.parse
      expect(log_file.pages.count).to eq 2
    end
  end
end
