require 'spec_helper'

require_relative '../lib/piece'

describe Piece do
  describe 'available_moves on subclass' do
    class NotImplementedTestPiece < Piece
    end

    class ImplementedTestPiece < Piece
      def available_moves
        %w(a1 a2)
      end
    end

    context 'when not implemented' do
      subject { NotImplementedTestPiece.new('a1').available_moves }

      it 'should raise an error' do
        expect { subject }.to raise_error(NotImplementedError)
      end
    end

    context 'when implemented' do
      subject { ImplementedTestPiece.new('a1').available_moves }

      it { is_expected.to eq %w(a1 a2) }
    end
  end
end