require 'pg'

task :setup_test_database do
  #p "Cleaning database..."
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE chits, users;")
  
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")

    connection = PG.connect(dbname: database)
    
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));")
<<<<<<< HEAD
    connection.exec("CREATE TABLE chits(id SERIAL PRIMARY KEY, text VARCHAR(240), author_email VARCHAR(60), author_id INTEGER REFERENCES users (id));")
=======
    connection.exec("CREATE TABLE chits(id SERIAL PRIMARY KEY, text VARCHAR(240), author_id INTEGER REFERENCES users (id));")
>>>>>>> 6235faece5df700477f7bb978e6b58d88992e4be
    
  end
end

task :teardown do
  p "Destroying databases...type 'y' to confirm that you want to destroy the Chitter databases. This will remove all data in those databases!"

  confirm = STDIN.gets.chomp

  return unless confirm == 'y'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database }")
  end
end