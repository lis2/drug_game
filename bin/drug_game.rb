#!/usr/bin/env ruby
$:.unshift File.expand_path(__FILE__ + '/../../lib')
require "game_window"

game_window = DrugGame::GameWindow.new
game_window.show

puts "Your score: #{game_window.player.score}"
