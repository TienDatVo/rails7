class PagesController < ApplicationController
  # def home
  #   if params[:search].present?
  #     @books = Book.where("LOWER(name_book) LIKE ?", "%#{params[:search].downcase}%").where(status: 1).order(:id)
  #     @category = Category.where(status: 1)
  #   else
  #     @category = Category.where(status: 1)
  #     @books = Book.includes(:discounts).where(status: 1).order(:id)
  #   end
  # end
  # def home
  #   @category = Category.where(status: 1)
    
  #   if params[:search].present?
  #     @books = Book.where("LOWER(name_book) LIKE ?", "%#{params[:search].downcase}%")
  #                  .where(status: 1)
  #                  .includes(:discounts)
  #                  .order(:id)
  #   elsif params[:category_id].present?
  #     @books = Book.includes(:discounts)
  #            .joins(:category)
  #            .where(categories: { id: params[:category_id], status: 1 })
  #            .where(status: 1)
  #            .order(:id)
  #   else
  #     @books = Book.includes(:discounts)
  #                  .where(status: 1)
  #                  .order(:id)
  #   end
  # end

  def home
    @category = Category.where(status: 1)
    
    if params[:search].present?
      @books = Book.where("LOWER(name_book) LIKE ?", "%#{params[:search].downcase}%")
                   .where(status: 1)
                   .order(:id)
    elsif params[:category_id].present?
      @books = Book.joins(:category)
                   .where(categories: { id: params[:category_id], status: 1 })
                   .where(status: 1)
                   .order(:id)
    else
      @books = Book.where(status: 1)
                   .order(:id)
    end
  end
  
  
  

  def show
    @book = Book.find(params[:id])
    @evaluaters = Evaluater.where(book_id: @book.id).includes(:user)
  end

  def category
    @category = Category.where(status: 1)
    # byebug  
    if params[:category_id].present?
      @books = Book.joins(:category)
                   .where(categories: { id: params[:category_id], status: 1 })
                   .where(status: 1)
                   .order(:id)
      redirect_to request.referrer
    else
      @books = []
      redirect_to request.referrer
    end
  end
  
  
end