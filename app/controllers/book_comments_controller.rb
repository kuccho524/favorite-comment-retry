class BookCommentsController < ApplicationController
  # コメント投稿
  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    @book_comment.save
    redirect_back(fallback_location: root_path)
  end

  # コメント削除
  def destroy
    @book = Book.find(params[:book_id])
    book_comment = BookComment.find(params[:id])
    book_comment.destroy
    redirect_to book_path(@book.id)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
