# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Parser::Print do
  let(:parser) { described_class.new('/file_path') }

  let(:pages) do
    [Parser::Page.new('/about',
                      [Parser::View.new('/about 722.247.931.582'),
                       Parser::View.new('/about 722.247.931.582'),
                       Parser::View.new('/about 722.247.931.582')]),
     Parser::Page.new('/index',
                      [Parser::View.new('/index 722.247.931.582'),
                       Parser::View.new('/index 543.910.244.929')])]
  end

  before do
    allow(parser).to receive(:pages).and_return(pages)
  end

  describe '#print_most_views' do
    it 'prints most views' do
      expect { parser.print_most_views }.to output("/about 3 visits\n/index 2 visits\n").to_stdout
    end
  end

  describe '#print_uniq_views' do
    it 'prints uniq views' do
      expect { parser.print_uniq_views }.to output("/index 2 unique views\n/about 1 unique views\n").to_stdout
    end
  end

  describe '#print_errors' do
    context 'when no errors' do
      it 'returns nothing' do
        expect { parser.print_errors }.to output('').to_stdout
      end
    end

    context 'when errors present' do
      it 'returns errors' do
        allow_any_instance_of(Parser::LogFile).to receive_messages(errors: ['Very important message'])

        expect { parser.print_errors }.to output('Very important message').to_stdout
      end
    end
  end
end
