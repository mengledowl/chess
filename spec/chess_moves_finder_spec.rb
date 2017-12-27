require 'spec_helper'

require_relative '../lib/chess_moves_finder'

describe ChessMovesFinder do
  describe 'retrieve_available_moves' do
    subject { described_class.new(chess_piece, at: position).retrieve_available_moves }

    context 'when chess_piece is queen' do
      let(:chess_piece) { 'queen' }

      context 'when piece is at location d4' do
        let(:position) { 'd4' }

        it { is_expected.to match_array %w(d1 d2 d3 d5 d6 d7 d8 a4 b4 c4 e4 f4 g4 h4 c5 b6 a7 e3 f2 g1 a1 b2 c3 e5 f6 g7 h8) }
      end

      context 'when piece is at location a1' do
        let(:position) { 'a1' }

        it { is_expected.to match_array %w(a2 a3 a4 a5 a6 a7 a8 b2 c3 d4 e5 f6 g7 h8 b1 c1 d1 e1 f1 g1 h1) }
      end

      context 'when piece is at location h5' do
        let(:position) { 'h5' }

         it { is_expected.to match_array %w(h1 h2 h3 h4 h6 h7 h8 a5 b5 c5 d5 e5 f5 g5 e8 f7 g6 d1 e2 f3 g4) }
      end
    end

    context 'when chess_piece is a rook' do
      let(:chess_piece) { 'rook' }

      context 'when piece is at location d4' do
        let(:position) { 'd4' }

        it { is_expected.to match_array %w(d1 d2 d3 d5 d6 d7 d8 a4 b4 c4 e4 f4 g4 h4) }
      end

      context 'when piece is at location a1' do
        let(:position) { 'a1' }

        it { is_expected.to match_array %w(a2 a3 a4 a5 a6 a7 a8 b1 c1 d1 e1 f1 g1 h1) }
      end

      context 'when piece is at location h5' do
        let(:position) { 'h5' }

        it { is_expected.to match_array %w(h1 h2 h3 h4 h6 h7 h8 a5 b5 c5 d5 e5 f5 g5) }
      end
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