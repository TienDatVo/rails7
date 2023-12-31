class BookDiscountsController < ApplicationController
  def index
    # @discount = Discount.where(status: 1) 
    @books = Book.joins(:discounts).where(discounts: { status: 1 }, books: {status: 1}).includes([:discounts])
    if params[:discount_detail].present? && params[:discount_detail][:discount_id].present?
      @discounts = Discount.find_by(id: params[:discount_detail][:discount_id])
      if @discounts.present?
        @discount = Discount.where(status: 1)
        @books = @discounts.books.where(status: 1)
      else
        flash[:error] = t('flash.error')
        redirect_to '/book_discounts'
      end
    elsif @books.present?
      @discount = Discount.where(status: 1)
      @book = Book.joins(:discounts).where(discounts: { status: 1 }).includes([:discounts])
    else
      @discount = Discount.where(status: 1)
      @books = []
    end
  end
      
end
