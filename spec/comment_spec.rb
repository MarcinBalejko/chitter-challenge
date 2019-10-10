require 'comment'
require 'chit'
require 'database_helpers'

describe Comment do
  let(:user) { User.create(email: 'user@gmail.com', password: 'testpassword', name: 'User') }
  describe '.create' do
    it 'creates a new comment' do
      chit = Chit.create(text: 'Test Chit 1', time: Time.now, author_id: user.id, author_email: 'user@gmail.com', author_name: 'User')
      comment = Comment.create(text: 'This is a test comment', chit_id: chit.id, comment_author: chit.author_name)

      persisted_data = persisted_data(id: comment.id, table: 'comments')

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.chit_id).to eq chit.id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the databse' do
        chit = Chit.create(text: 'Test Chit 1', time: Time.now, author_id: user.id, author_email: 'user@gmail.com', author_name: 'User')
        comment = Comment.create(text: 'This is a test comment', chit_id: chit.id, comment_author: chit.author_name)
        Comment.create(text: 'This is a second test comment', chit_id: chit.id, comment_author: chit.author_name)

        comments = Comment.where(chit_id: chit.id)
        comment = comments.first
        persisted_data = persisted_data(table: 'comments', id: comment.id)

        expect(comments.length).to eq 2
        expect(comment.id).to eq persisted_data.first['id']
        expect(comment.text).to eq 'This is a test comment'
        expect(comment.chit_id).to eq chit.id
        end
  end

  describe '.all' do
    it 'returns a list of comments' do
        chit = Chit.create(text: 'Test Chit 1', time: Time.now, author_id: user.id, author_email: 'user@gmail.com', author_name: 'User')
        comment_1 = Comment.create(text: 'This is a test comment_1', chit_id: chit.id, comment_author: chit.author_name)
        comment_2 = Comment.create(text: 'This is a test comment_2', chit_id: chit.id, comment_author: chit.author_name)

        comments = Comment.all
        
        expect(comments.length).to eq 2
        expect(comments.first).to be_a Comment
        expect(comments.first.text).to eq 'This is a test comment_1'   
    end
  end

  describe '.delete' do
    it 'deletes the given comment' do
        chit = Chit.create(text: 'Test Chit 1', time: Time.now, author_id: user.id, author_email: 'user@gmail.com', author_name: 'User')
        comment_1 = Comment.create(text: 'This is a test comment_1', chit_id: chit.id, comment_author: chit.author_name)
        comment_2 = Comment.create(text: 'This is a test comment_2', chit_id: chit.id, comment_author: chit.author_name)

        Comment.delete(id: comment_1.id)
        expect(Comment.all.length).to eq(1)
    end
  end

  
end