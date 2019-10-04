require 'pg'

task :setup_test_database do
  #p "Cleaning database..."
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE chits;")
  
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")

    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE chits(id SERIAL PRIMARY KEY, text VARCHAR(240));")
  end
end

task :teardown do
  p "Destroying databases...type 'y' to confirm that you want to destroy the Bookmark Manager databases. This will remove all data in those databases!"

  confirm = STDIN.gets.chomp

  return unless confirm == 'y'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database }")
  end
end