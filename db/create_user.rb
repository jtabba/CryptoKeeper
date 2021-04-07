require 'bcrypt'
require 'pg'

require_relative 'lib'

post '/create_user' do
    password_digest = BCrypt::Password.create(password)
    
    sql = "INSERT INTO users (email, user_name, password_digest) VALUES ($1, $2, $3);"
    run_sql(sql, [
        email,
        user_name,
        password_digest
        ])


    redirect '/login'
end
