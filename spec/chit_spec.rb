require 'chit'
require 'database_helpers'
require 'user'

describe Chit do
  let(:user) { User.create(email: 'user@gmail.com', password: 'testpassword', name: 'User') }
  let(:chit_1) { Chit.create(text: 'Test Chit 1', time: '2019-10-10 22:20:22 +0200', author_id: user.id, author_email: 'user@gmail.com', author_name: 'User') }
  let(:chit_2) { Chit.create(text: 'Test Chit 2', time: '2019-10-10 22:20:22 +0200', author_id: user.id, author_email: 'user@gmail.com', author_name: 'User') }
  let(:chit_3) { Chit.create(text: 'Test Chit 3', time: '2019-10-10 22:20:22 +0200', author_id: user.id, author_email: 'user@gmail.com', author_name: 'User') }
  describe '.all' do
    it 'returns a list of chits' do
      chit_1
      chit_2
      chit_3
      
      chits = Chit.all
      
      expect(chits.length).to eq 3
      expect(chits.first).to be_a Chit
      expect(chits.first.id).to eq chit_1.id
      expect(chits.first.text).to eq 'Test Chit 1'
      expect(chits.first.time).to eq('2019-10-10 22:20:22 +0200')
      expect(chits.first.author_email).to eq 'user@gmail.com'
      expect(chits.first.author_name).to eq 'User'
    end
  end

  describe '.create' do
    it 'creates a new chit' do
      chit_1
      persisted_data = persisted_data(id: chit_1.id, table: 'chits')

      expect(chit_1).to be_a Chit
      expect(chit_1.id).to eq persisted_data.first['id']
      expect(chit_1.text).to eq 'Test Chit 1'
    end
  end

  describe '.delete' do
    it 'deletes the given chit' do
      chit_1
      Chit.delete(id: chit_1.id)
      expect(Chit.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the chit with the given data' do
      chit_1
      updated_chit = Chit.update(id: chit_1.id, text: 'Test Chit 2', time: '2019-10-10 22:20:22 +0200', author_id: user.id, author_email: user.email, author_name: user.name)
      

      expect(updated_chit).to be_a Chit
      expect(updated_chit.id).to eq chit_1.id
      expect(updated_chit.text).to eq 'Test Chit 2'
    end
  end

  describe '.find' do
    it 'returns the requested chit object' do
      chit_1
      result = Chit.find(id: chit_1.id)

      expect(result).to be_a Chit
      expect(result.id).to eq chit_1.id
      expect(result.text).to eq 'Test Chit 1'
    end
  end

end
  