class PaymentsController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to categories_url
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.author = current_user

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment.categories.first, notice: 'Payment was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
