class PaymentsController < ApplicationController

  def create
    @payment = Payment.new(payment_params)
    unless helpers.current_user.groups.ids.include? payment_params[:group_id].to_i
      raise SanityError.new("User is not a member of group")
    end
    # render json: payment_params
    if @payment.save
      render json: @payment
    else
      render json: @payment.errors.full_messages
    end
  end

  def edit
  end

  private
  def payment_params
    params.require(:payment).permit(:amount, :description, :group_id).merge(user_id: helpers.current_user.id)
  end

end
