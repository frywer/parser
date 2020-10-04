# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Parser::LogFile do
  let(:log_file) do
    Parser::LogFile.new('/path')
  end

  describe '#file_exist?' do
    context 'when file exist' do
      it 'return true' do
        allow(File).to receive(:exist?).and_return(true)

        expect { log_file.file_exist? }.not_to raise_error
      end
    end

    context 'when file missing' do
      it 'return raise FileMissing' do
        expect { log_file.file_exist? }.to raise_error(Parser::LogFile::FileMissing)
      end
    end
  end
end
