require_relative './database_connection'

class Comment
  attr_reader :id, :text, :chit_id, :comment_author

  def initialize(id:, text:, chit_id:, comment_author:)
    @id = id
    @text = text
    @chit_id = chit_id
    @comment_author = comment_author
  end

  def self.create(chit_id:, text:, comment_author:)
    result = DatabaseConnection.query("INSERT INTO comments (chit_id, text, comment_author) VALUES ('#{chit_id}','#{text}','#{comment_author}') RETURNING id, text, chit_id, comment_author;")
    Comment.new(id: result[0]['id'], text: result[0]['text'], chit_id: result[0]['chit_id'], comment_author: result[0]['comment_author'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM comments WHERE id = #{id}")
  end

  def self.delete_with_chit(id:)
    DatabaseConnection.query("DELETE FROM comments WHERE chit_id = #{id}")
  end

  def self.where(chit_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE chit_id = #{chit_id};")
    result.map do |comment|
      Comment.new(id: comment['id'], text: comment['text'], chit_id: comment['chit_id'], comment_author: comment['comment_author'])
    end
  end

  def self.all
    comments = DatabaseConnection.query('SELECT * FROM comments;')
    comments.map do |comment|
      Comment.new(id: comment['id'], text: comment['text'], chit_id: comment['chit_id'], comment_author: comment['comment_author'])
    end
  end

end