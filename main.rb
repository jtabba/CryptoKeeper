     
# require 'cryptocompare'
require 'HTTParty'
require 'sinatra'
require 'bcrypt'

require_relative 'db/lib'

if development?
  require 'sinatra/reloader'
  require 'pry'
end


get '/' do
  cryptos = HTTParty.get("https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD&api_key={c39754cf2b06132d4f3631345fe4a3dda0e0e232cd5920d8c0bd0ad0bcf4274b}")

  erb :index, locals: { 
    cryptos: cryptos 
  }
end

get '/price_test' do
  crypto = HTTParty.get("https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=USD")
  
  erb :index_test, locals: {
    from_symbol: crypto['Data'][0]['DISPLAY']['USD']['FROMSYMBOL'],
    to_symbol: crypto['Data'][0]['DISPLAY']['USD']['TOSYMBOL'],
    price: crypto['Data'][0]['RAW']['USD']['PRICE'],
    hour: crypto['Data'][0]['DISPLAY']['USD']['CHANGEHOUR'],
    day: crypto['Data'][0]['DISPLAY']['USD']['CHANGEDAY'],
    low: crypto['Data'][0]['RAW']['USD']['LOW24HOUR'],
    high: crypto['Data'][0]['RAW']['USD']['HIGH24HOUR'],
    volume: crypto['Data'][0]['DISPLAY']['USD']['TOTALVOLUME24HTO'],
    marketcap: crypto['Data'][0]['DISPLAY']['USD']['MKTCAP'],
    image: crypto['Data'][0]['DISPLAY']['USD']['IMAGEURL']
  } 
end


# get '/price_test' do
#   crypto = HTTParty.get("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC&tsyms=USD&api_key={c39754cf2b06132d4f3631345fe4a3dda0e0e232cd5920d8c0bd0ad0bcf4274b}")

#   erb :index_test, locals: {
#     from_symbol: crypto['DISPLAY']['BTC']['USD']['FROMSYMBOL'],
#     to_symbol: crypto['DISPLAY']['BTC']['USD']['TOSYMBOL'],
#     price: crypto['RAW']['BTC']['USD']['PRICE'],
#     hour: crypto['DISPLAY']['BTC']['USD']['CHANGEHOUR'],
#     day: crypto['DISPLAY']['BTC']['USD']['CHANGEDAY'],
#     low: crypto['RAW']['BTC']['USD']['LOW24HOUR'],
#     high: crypto['RAW']['BTC']['USD']['HIGH24HOUR'],
#     volume: crypto['DISPLAY']['BTC']['USD']['TOTALVOLUME24HTO'],
#     marketcap: crypto['DISPLAY']['BTC']['USD']['MKTCAP'],
#     image: crypto['DISPLAY']['BTC']['USD']['IMAGEURL']
#   } 
# end


# get 'crypto' do
#   crypto = Cryptocompare::Price.find('BTC', 'USD')

#   erb :crypto_details, locals: { price: price }
# end





