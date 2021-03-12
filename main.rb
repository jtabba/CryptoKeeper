     
require 'httparty'
require 'sinatra'
require 'bcrypt'
require_relative 'db/lib'


enable :sessions


if development?
  require 'sinatra/reloader'
  require 'pry'
end


def logged_in?()
  if session[:user_id]
    return true
  else
    return false
  end 
end


def current_user
  db = PG.connect(dbname: 'cryptokeeper')
  sql = "SELECT * FROM users WHERE id = #{session[:user_id]}"

  result = db.exec(sql)

  return result[0]
end


get '/crypto_details' do
  # crypto = HTTParty.get("https://min-api.cryptocompare.com/data/price?fsym=#{params[:crypto]}&tsyms=USD")

  erb :crypto_details
  # , locals: {
  #  from_symbol: crypto['DISPLAY']['USD']['FROMSYMBOL']
  #  to_symbol: crypto['DISPLAY']['USD']['TOSYMBOL'],
  #  price: crypto['DISPLAY']['USD']['PRICE'],
  #  hour: crypto['DISPLAY']['USD']['CHANGEHOUR'],
  #  day: crypto['DISPLAY']['USD']['CHANGEDAY'],
  #  low: crypto['DISPLAY']['USD']['LOW24HOUR'],
  #  high: crypto['DISPLAY']['USD']['HIGH24HOUR'],
  #  volume: crypto['DISPLAY']['USD']['TOTALVOLUME24HTO'],
  #  marketcap: crypto['DISPLAY']['USD']['MKTCAP'],
  #  image: crypto['DISPLAY']['USD']['IMAGEURL']
  # } 
end


get '/' do
  cryptos = HTTParty.get("https://min-api.cryptocompare.com/data/top/mktcapfull?limit=100&tsym=USD")
  erb :index, locals: { cryptos: cryptos['Data'] } 
end


get '/crypto_details' do

  erb :crypto_details
end

get '/announcements' do

  # redirect '/login' unless logged_in?

  announcements = run_sql("SELECT * FROM announcements;")

  erb :announcements, locals: { announcements: announcements }
end


get '/create_announcement' do
  erb :new_announcement;
end


post '/get_announcement' do
  redirect '/login' unless logged_in?

  sql = "INSERT INTO announcements (title, image_url, content, user_id) VALUES ($1, $2, $3, $4);"
  run_sql(sql, [
    params[:title],
    params[:image_url],
    params[:content],
    current_user()['id']
  ])

  redirect '/announcements'
end


get '/get_announcement/:id' do
  announcement = run_sql("SELECT * FROM announcements WHERE id = $1", [params[:id]])[0]

  erb :announcement_details, locals: { announcement: announcement }
end


delete '/get_announcement/:id' do
  redirect '/login' unless logged_in?

  sql = "DELETE FROM announcements WHERE id = $1;"
  run_sql(sql, [
    params[:id]
  ])

  redirect '/announcements'
end


get "/get_announcement/:id/edit" do
  redirect '/login' unless logged_in?
  
  announcement = run_sql("SELECT * FROM announcements WHERE id = $1", [params[:id]])[0]

  erb :edit_announcement, locals: { announcement: announcement }
end


patch '/get_announcement/:id' do
  redirect '/login' unless logged_in?

  run_sql(
    "UPDATE announcements SET title = $1, image_url = $2, content = $3 WHERE id = $4;", [
    params[:title],
    params[:image_url],
    params[:content],
    params[:id]
  ])

  redirect "/get_announcement/#{params[:id]}"
end


get '/signup' do
  erb :signup
end


get '/login' do
  erb :login
end


post '/session' do

  db = PG.connect(dbname: 'cryptokeeper')
  sql = "SELECT * FROM users WHERE email = $1;"
  results = run_sql(sql, [
    params[:email]
  ])

  if results.count == 1 && BCrypt::Password.new(results[0]['password_digest']).==(params[:password])
    session[:user_id] = results[0]['id']
    redirect '/'
  else
    erb :login
  end
end


delete '/session' do
  session[:user_id] = nil

  redirect '/'
end

# get '/price_test' do
#   crypto = HTTParty.get("https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=USD")
  
#   erb :index_test, locals: {
#     from_symbol: crypto['Data'][0]['DISPLAY']['USD']['FROMSYMBOL'],
#     to_symbol: crypto['Data'][0]['DISPLAY']['USD']['TOSYMBOL'],
#     price: crypto['Data'][0]['RAW']['USD']['PRICE'],
#     hour: crypto['Data'][0]['DISPLAY']['USD']['CHANGEHOUR'],
#     day: crypto['Data'][0]['DISPLAY']['USD']['CHANGEDAY'],
#     low: crypto['Data'][0]['RAW']['USD']['LOW24HOUR'],
#     high: crypto['Data'][0]['RAW']['USD']['HIGH24HOUR'],
#     volume: crypto['Data'][0]['DISPLAY']['USD']['TOTALVOLUME24HTO'],
#     marketcap: crypto['Data'][0]['DISPLAY']['USD']['MKTCAP'],
#     image: crypto['Data'][0]['DISPLAY']['USD']['IMAGEURL']
#   } 
# end



