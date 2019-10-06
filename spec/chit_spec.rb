require 'chit'
require 'database_helpers'
require 'user'

describe Chit do
  let(:user) { User.create(email: 'user@gmail.com', password: 'testpassword') }
  describe '.all' do
    it 'returns a list of chits' do
      chit = Chit.create(text: 'Test Chit 1')
      Chit.create(text: 'Test Chit 2')
      Chit.create(text: 'Test Chit 3')
      chits = Chit.all
      
      expect(chits.length).to eq 3
      expect(chits.first).to be_a Chit
      expect(chits.first.id).to eq chit.id
      expect(chits.first.text).to eq 'Test Chit 1'
    end
  end

  describe '.create' do
    it 'creates a new chit' do
      chit = Chit.create(text: 'Test Chit 1')
      persisted_data = persisted_data(id: chit.id, table: 'chits')

      expect(chit).to be_a Chit
      expect(chit.id).to eq persisted_data.first['id']
      expect(chit.text).to eq 'Test Chit 1'
    end
  end

  describe '.delete' do
    it 'deletes the given chit' do
      chit = Chit.create(text: 'Test Chit 1')
      Chit.delete(id: chit.id)
      expect(Chit.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the chit with the given data' do
      chit = Chit.create(text: 'Test Chit 1')
      updated_chit = Chit.update(id: chit.id, text: 'Test Chit 2')

      expect(updated_chit).to be_a Chit
      expect(updated_chit.id).to eq chit.id
      expect(updated_chit.text).to eq 'Test Chit 2'
    end
  end

  describe '.find' do
    it 'returns the requested chit object' do
      chit = Chit.create(text: 'Test Chit 1')
      result = Chit.find(id: chit.id)

      expect(result).to be_a Chit
      expect(result.id).to eq chit.id
      expect(result.text).to eq 'Test Chit 1'
    end
  end

end
  