require_relative "best_beer/version"

require 'open-uri'
require 'pry'
require 'nokogiri'

require_relative "beer.rb"
require_relative "brewery.rb"
require_relative "beer_scraper.rb"

  def the_options
    puts "Enter a beer's rating, menu, or exit."
    input = gets.strip
    if input == "menu"
      menu
    elsif input == "exit"
      say_goodbye
    elsif input.to_i.between?(1,250)
      more_beer_info(input)
      the_options
    else
      puts "I'm not quite sure what you mean."
      the_options
    end
  end

  def start
    BeerScraper.create_beers
    menu
  end

  def menu
    show_menu
    input = gets.strip
    if input == "1"
      top_beers
      the_options
    elsif input == "2"
      top_25_beers
      the_options
    elsif input == "3"
      top_50_beers
      the_options
    elsif input == "4"
      top_100_beers
      the_options
    elsif input == "exit"
      say_goodbye
    else
      puts "Sorry, didn't catch that!"
      menu
    end
  end


  def show_menu
    puts "What would you like to view?"
    puts "MENU:"
    puts "1 - Top Beers"
    puts "2 - Top 25 Beers"
    puts "3 - Top 50 Beers"
    puts "4 - Top 100 Beers"
    puts "or exit"
  end

  def say_goodbye
    puts "Thirst quenched!"
  end

  def top_beers
    puts "Here are the current top 250 rated beers:"
    Beer.all.each do |b|
      puts "#{b.rating}. #{b.name} - #{b.brewery.name}"
    end
  end

  def top_25_beers
    puts "Here are the current top 25 rated beers:"
    Beer.all[0,25].each do |b|
      puts "#{b.rating}. #{b.name} - #{b.brewery.name}"
    end
  end

  def top_50_beers
    puts "Here are the current top 50 rated beers:"
    Beer.all[0,50].each do |b|
      puts "#{b.rating}. #{b.name} - #{b.brewery.name}"
    end
  end

  def top_100_beers
    puts "Here are the current top 100 rated beers:"
    Beer.all[0,100].each do |b|
      puts "#{b.rating}. #{b.name} - #{b.brewery.name}"
    end
  end

  def more_beer_info(beer_rating)
    beer = Beer.all.find {|b| b.rating == beer_rating}
    puts "Further information on #{beer.name} by #{beer.brewery.name}:"
    puts "#{beer.rating}. #{beer.name} - #{beer.brewery.name} - #{beer.type} - #{beer.abv}"
  end
