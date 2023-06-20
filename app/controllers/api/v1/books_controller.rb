class Api::V1::BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def show
    render json: Book.find(params[:id])
  end

  def create
    render json: Book.create!(book_params)
  end

  def update
    # book_to_update = Book.find(params[:id])
    # book_to_update.update(book_params)
    render json: Book.update(params[:id], book_params)
  end

  def destroy
    # render json: Book.destroy(params[:id]) ## Also works, but correct method is delete
    render json: Book.delete(params[:id])
  end

  private
  def book_params
    # why do we need to require(:book) here - this makes sure that it is in fact a book object?
    params.require(:book).permit(:author, :title, :genre, :summary, :number_sold)
  end
end