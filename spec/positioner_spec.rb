require 'spec_helper'

require_relative '../lib/positioner'

describe Positioner do
  describe 'move' do
    context 'when passed up:' do
      subject { described_class.new(%w(d 4)).move(up: spaces) }

      context '1' do
        let(:spaces) { 1 }

        it { is_expected.to eq %w(d 5) }
      end

      context '2' do
        let(:spaces) { 2 }

        it { is_expected.to eq %w(d 6) }
      end

      context 'and right: 1' do
        subject { described_class.new(%w(d 4)).move(up: spaces, right: spaces) }

        let(:spaces) { 1 }

        it { is_expected.to eq %w(e 5) }
      end
    end

    context 'when passed down:' do
      subject { described_class.new(%w(d 4)).move(down: spaces) }

      context '1' do
        let(:spaces) { 1 }

        it { is_expected.to eq %w(d 3) }
      end

      context '2' do
        let(:spaces) { 2 }

        it { is_expected.to eq %w(d 2) }
      end

      context 'and right: 1' do
        subject { described_class.new(%w(d 4)).move(down: spaces, right: spaces) }

        let(:spaces) { 1 }

        it { is_expected.to eq %w(e 3) }
      end
    end
  end
end