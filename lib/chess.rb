#!/usr/bin/env ruby

require_relative 'chess/chess_moves_finder'

piece_index = ARGV.index('-piece') + 1
position_index = ARGV.index('-position') + 1

piece = ARGV[piece_index]
position = ARGV[position_index]

puts ChessMovesFinder.new(piece, at: position).retrieve_available_moves.join(', ')