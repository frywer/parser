# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Parser::Print do
  let(:parser) { described_class.new('/file_path') }

  describe '#most_views' do
    it 'prints most views' do
      expect { parser.most_views }.to output('/home 90 visits').to_stdout
    end
  end

  describe '#uniq_views' do
    it 'prints uniq views' do
      expect { parser.most_views }.to output('/about/2 8 unique views').to_stdout
    end
  end
end
