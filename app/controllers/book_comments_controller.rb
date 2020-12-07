class BookCommentsController < ApplicationController
  def create
    @book_detail = Book.find(params[:book_id])
    comment = BookComment.new(book_comments_params)
    comment.book_id = @book_detail.id
    comment.user_id = current_user.id
    comment.save
    #redirect_to book_path(book.id)
  end
  
  
  def destroy
    @book_detail = Book.find(params[:book_id])
    comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    comment.destroy
    # book_path(params[:book_id])
  end
  
  private
  
  def book_comments_params
    params.require(:book_comment).permit(:comment)
  end
  
end
