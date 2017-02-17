require_relative "best_beer/version"

require 'open-uri'
require 'pry'
require 'nokogiri'

require_relative "beer.rb"
require_relative "brewery.rb"
require_relative "beer_scraper.rb"

  def show_menu
    puts "What would you like to view?"
    puts "MENU:"
    puts "Enter the number next to your choice"
    puts "1 - Top Beers"
    puts "2 - Top 25 Beers"
    puts "3 - Top 50 Beers"
    puts "4 - Top 100 Beers"
    puts "5 - Exit"
  end

  def say_goodbye
    puts "Thirst quenched!"
  end

  def top_beers
    puts "Here are the current top 250 rated beers:"
    Beer.all.each do |b|
      puts "#{b.rating}. #{b.name} - #{b.brewery.name}"
    end
    puts "Enter a beer's rating to see more info."
    puts "Options: 'menu', 'exit'"
  end

  def top_25_beers
    puts "Here are the current top 25 rated beers:"
    Beer.all[0,25].each do |b|
      puts "#{b.rating}. #{b.name} - #{b.brewery.name}"
    end
    puts "Enter a beer's rating to see more info."
    puts "Options: 'menu', 'exit'"
  end

  def top_50_beers
    puts "Here are the current top 50 rated beers:"
    Beer.all[0,50].each do |b|
      puts "#{b.rating}. #{b.name} - #{b.brewery.name}"
    end
    puts "Enter a beer's rating to see more info."
    puts "Options: 'menu', 'exit'"
  end

  def top_100_beers
    puts "Here are the current top 100 rated beers:"
    Beer.all[0,100].each do |b|
      puts "#{b.rating}. #{b.name} - #{b.brewery.name}"
    end
    puts "Enter a beer's rating to see more info."
    puts "Options: 'menu', 'exit'"
  end

  def more_beer_info(beer_rating)
    beer = Beer.all.find {|b| b.rating == beer_rating}
    puts "Further information on #{beer.name} by #{beer.brewery.name}:"
    puts "#{beer.rating}. #{beer.name} - #{beer.brewery.name} - #{beer.type} - #{beer.abv}"
    puts "Options: 'menu', 'exit'"
  end
