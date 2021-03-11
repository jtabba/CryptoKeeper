require 'pg'

def run_sql(sql, arr = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'cryptokeeper'})
    results = db.exec_params(sql, arr)
    db.close
    return results
end