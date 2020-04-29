# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  describe 'index' do
    context 'when contract does not exist' do
      let(:contract_id) { 'non-existent-id' }

      it 'raises error' do
        expect do
          get contract_payments_path(contract_id: contract_id),
              headers: { 'Accept' => 'application/json' }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when contract exists' do
      let!(:contract) { Contract.create(label: 'test contract') }

      context 'when payments do not exist' do
        before do
          get contract_payments_path(contract_id: contract.id),
              headers: { 'Accept' => 'application/json' }
        end

        it 'returns an empty array' do
          expect(response).to have_http_status(:success)
          expect(response.content_type).to match('application/json')
          expect(response.body).to eql('[]')
        end
      end

      context 'when 5 payments exist' do
        let!(:payments) do
          5.times.map do |idx|
            contract.payments.create!(
              description: "test description #{idx}",
              value: rand(1000)
            )
          end
        end

        before do
          get contract_payments_path(contract_id: contract.id),
              headers: { 'Accept' => 'application/json' }
        end

        it 'returns all payments' do
          expect(response).to have_http_status(:success)
          expect(response.content_type).to match('application/json')
          expect(JSON.parse(response.body).length).to eql(5)
        end
      end

      context 'when 6 payments exist' do
        let!(:payments) do
          6.times.map do |idx|
            contract.payments.create!(
              description: "test description #{idx}",
              value: rand(1000)
            )
          end
        end

        let!(:link_header) do
          next_page_url = contract_payments_url(
            contract_id: contract.id, page: 2, per_page: 5
          )
          last_page_url = contract_payments_url(
            contract_id: contract.id, page: 2, per_page: 5
          )

          "<#{next_page_url}>; rel=\"next\", <#{last_page_url}>; rel=\"last\""
        end

        it 'returns 5 in the first page' do
          get contract_payments_path(contract_id: contract.id, per_page: 5),
              headers: { 'Accept' => 'application/json' }

          expect(response).to have_http_status(:success)
          expect(response.content_type).to match('application/json')
          expect(JSON.parse(response.body).length).to eql(5)

          expect(response.headers['link']).to eql(link_header)
        end

        context 'second page' do
          let!(:link_header) do
            prev_page_url = contract_payments_url(
              contract_id: contract.id, page: 1, per_page: 5
            )
            first_page_url = contract_payments_url(
              contract_id: contract.id, page: 1, per_page: 5
            )

            "<#{prev_page_url}>; rel=\"prev\", <#{first_page_url}>; rel=\"first\""
          end

          before do
            url = contract_payments_path(
              contract_id: contract.id, page: 2, per_page: 5
            )

            get url, headers: { 'Accept' => 'application/json' }
          end

          it 'returns 1 payment' do
            expect(response).to have_http_status(:success)
            expect(response.content_type).to match('application/json')
            expect(JSON.parse(response.body).length).to eql(1)

            expect(response.headers['link']).to eql(link_header)
          end
        end
      end
    end
  end
end
