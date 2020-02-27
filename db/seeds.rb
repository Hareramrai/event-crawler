# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

web_resource = WebResource.create(name: 'Co Berlin', url: 'https://www.co-berlin.org/en/calender')
web_parser = web_resource.build_parser

web_parser.tap do |parser|
  parser.host = 'https://www.co-berlin.org'
  parser.path = '/en/calender'
  parser.event_list_container = '/html/body/div[2]/main/div/div/div[2]/div'
  parser.url = './a/@href'
  parser.title = './a/div[2]/div[@class="article-title"]'
  parser.sub_title = './a/div[2]/div[@class="article-subtitle"]'
  parser.category  = './a/div[2]/div[1]/span[1]'
  parser.start_time = './a/div[2]/div[1]/span[2]/div/span[1]/@content'
  parser.end_time = './a/div[2]/div[1]/span[2]/div/span[2]/@content'
  parser.description = './a/div[2]/div[@class="article-text"]'
  parser.pagination = '/html/body/div[2]/main/div/div/div[3]/div/ul/li/a/@href'
  parser.save
end


web_resource = WebResource.create(name: 'Berghain', url: 'https://www.berghain.berlin/en/program/')

web_parser = web_resource.build_parser

web_parser.tap do |parser|
  parser.host = 'https://www.berghain.berlin'
  parser.path = '/en/program/'
  parser.event_list_container = '/html/body/div[2]/div/main/a'
  parser.url = './@href'
  parser.title = './h2'
  parser.sub_title = './h3'
  parser.category  = ''
  parser.start_time = './p'
  parser.end_time = ''
  parser.description = '.'
  parser.pagination = '/html/body/div[2]/div/main/nav/ul/li/a/@href'
  parser.save
end
