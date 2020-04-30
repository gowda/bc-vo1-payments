# frozen_string_literal: true

class PaymentsController < ApplicationController
  include Pagination

  def index
    @payments = contract.payments.page(current_page).per(current_per_page)

    response.set_header('link', link_header(@payments))
    render json: @payments
  end

  def create
    @payment = contract.payments.create!(payment_params)

    render json: @payment, status: :created
  end

  def update
    payment.update!(payment_params)

    render json: payment.reload, status: :ok
  end

  def destroy
    payment.destroy!

    render json: payment, status: :ok
  end

  private

  def contract
    @contract ||= Contract.find(params[:contract_id])
  end

  def payment
    @payment ||= Payment.find(params[:id])
  end

  def payment_params
    params.permit(:description, :value, :imported, :deleted)
  end
end
