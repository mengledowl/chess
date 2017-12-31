require 'spec_helper'

require_relative '../lib/args_parser'

describe ArgsParser do
  describe 'retrieve_arg' do
    subject { described_class.new(args).retrieve_arg('-piece') }

    context 'when argument flag not passed' do
      let(:args) { [] }

      it 'should abort' do
        expect { subject }.to raise_error(SystemExit)
      end
    end

    context 'when arugment itself is not passed' do
      let(:args) { ['-piece'] }

      it 'should abort' do
        expect { subject }.to raise_error(SystemExit)
      end
    end

    context 'when argument is passed' do
      let(:piece) { 'mypiece' }
      let(:args) { ['-piece', piece] }

      it { is_expected.to eq piece }
    end
  end
end