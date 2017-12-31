#!/usr/bin/env ruby

require_relative 'chess/chess_moves_finder'
require_relative 'args_parser'

parser = ArgsParser.new(ARGV)

puts ChessMovesFinder.new(parser.retrieve_arg('-piece'), at: parser.retrieve_arg('-position')).retrieve_available_moves.join(', ')