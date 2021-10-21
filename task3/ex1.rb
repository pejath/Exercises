require '../task2/ex2'
require 'nokogiri'

class World
  def initialize(world)
    @w = Nokogiri::XML.parse File.read(world)
    @world = @w.css('country')
  end
end

class Continents < World
  def initialize(world)
    super
    @con = {}
  end

  def continents
    @world.each{ |c| @con[c['name']] = c['continent'] }
    @con = @con.safe_invert
    @con.sort_by{ |key, _| key}.to_h
  end
end

class Countries < World
  def initialize(world)
    super
    @countries = {}
  end

  def inflation
    @world.each { |i| @countries[i['name']] = i['inflation'].to_i }
    @countries.sort_by { |_, value| value }.reverse[0, 4]
  end

  def population
    @world.sort_by { |_, value| value }.reverse[0]
  end
end
