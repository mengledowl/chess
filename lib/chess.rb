#!/usr/bin/env ruby

require_relative 'chess/chess_moves_finder'

piece_index = ARGV.index('-piece')
position_index = ARGV.index('-position')

abort 'Error: -piece argument is required' unless piece_index
abort 'Error: -position argument is required' unless position_index

piece = ARGV[piece_index + 1]
position = ARGV[position_index + 1]

puts ChessMovesFinder.new(piece, at: position).retrieve_available_moves.join(', ')