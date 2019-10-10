require 'pg'

task :setup_test_database do
  #p "Cleaning database..."
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE chits, users, comments;")
  
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")

    connection = PG.connect(dbname: database)
    
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140), name VARCHAR(60));")
    connection.exec("CREATE TABLE chits(id SERIAL PRIMARY KEY, text VARCHAR(240), time VARCHAR(60), author_email VARCHAR(60), author_name VARCHAR(60), author_id INTEGER REFERENCES users (id));")
    connection.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), chit_id INTEGER REFERENCES chits (id), comment_author VARCHAR(60));")  
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