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

  private

  def contract
    @contract ||= Contract.find(params[:contract_id])
  end

  def payment_params
    params.permit(:description, :value, :imported, :deleted)
  end
end
