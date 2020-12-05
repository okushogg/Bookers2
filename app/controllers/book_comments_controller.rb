class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comments_params)
    comment.book_id = book.id
    comment.user_id = current_user.id
    if comment.save
      redirect_to book_path,flash:{notice:'You have psoted a comment successfully.'}
    else
      render 'books/show',flash:{notice:"You can't post comments with blank."}
    end
  end
  
  
  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end
  
  private
  
  def book_comments_params
    params.require(:book_comment).permit(:comment)
  end
  
end
