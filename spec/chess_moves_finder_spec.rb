require 'spec_helper'

require_relative '../lib/chess_moves_finder'

describe ChessMovesFinder do
  describe 'retrieve_available_moves' do
    subject { described_class.new(chess_piece, at: 'd4').retrieve_available_moves }

    context 'when chess_piece is Queen' do
      let(:chess_piece) { 'queen' }

      it { is_expected.to match_array %w(d1 d2 d3 d5 d6 d7 d8 a4 b4 c4 e4 f4 g4 h4 c5 b6 a7 e3 f2 g1 a1 b2 c3 e5 f6 g7 h8) }
    end
  end

  describe 'position_from' do
    subject { described_class.new(nil, at: position).position }

    context 'when position is a4' do
      let(:position) { 'a4' }

      it { is_expected.to eq %w(a 4) }
    end

    context 'when position is h8' do
      let(:position) { 'h8' }
      it { is_expected.to eq %w(h 8) }
    end

    context 'when position is outside of the board area' do
      let(:position) { 'n4' }

      it { should eq nil }
    end
  end
end