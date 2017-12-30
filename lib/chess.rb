#!/usr/bin/env ruby

require_relative 'chess/chess_moves_finder'
require_relative 'chess/pieces/knight'
require_relative 'chess/pieces/queen'
require_relative 'chess/pieces/rook'

piece_index = ARGV.index('-piece') + 1
position_index = ARGV.index('-position') + 1

piece = ARGV[piece_index]
position = ARGV[position_index]

piece_class = Object.const_get(piece.capitalize)

available_moves = ChessMovesFinder.new(piece_class, at: position).retrieve_available_moves

puts available_moves.join(', ')