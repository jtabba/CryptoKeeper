require 'bcrypt'
require 'pg'

require_relative 'lib'

post '/create_user' do

    # email = ''
    # user_name = ''
    # password = ''

    
    sql = "INSERT INTO users (email, user_name, password_digest) VALUES ($1, $2, $3);"
    run_sql(sql, [
        email,
        user_name,
        password_digest
        ])

    password_digest = BCrypt::Password.create(password)

    redirect '/login'
end

# sql = "INSERT INTO users (email, password_digest) VALUES ($1, $2, $3);"
# run_sql(sql, [
#     params[:email],
#     params[:user_name],
#     params[:password_digest]
# ])



# sql = "insert into dishes (title, image_url, user_id) values ($1, $2, $3);"
# run_sql(sql, [
#     params[:title], 
#     params[:image_url], 
#     current_user()['id']
#     ])


#     def run_sql(sql, arr = []) # default is empty array and won't break if you call without a second argument
#         db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'goodfoodhunting'})
#         results = db.exec_params(sql, arr)
#         db.close
#         return results
#     end