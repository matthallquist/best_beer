class Beer
  attr_accessor :rating, :name, :brewery, :type, :abv

  @@all = []

  def initialize(rating, name, brewery, type, abv)
    @rating = rating
    @name = name
    @brewery = brewery
    @type = type
    @abv = abv
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create_beers
    array = BeerScraper.scrape_beers
    array.each do |stats|
      new_brewery = Brewery.find_or_create(stats[2])
      new_beer = Beer.new(stats[0],stats[1],new_brewery,stats[3],stats[4])
      new_beer.brewery.beers << [new_beer]
    end
  end

end
