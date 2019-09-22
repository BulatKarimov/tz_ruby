# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::V1::SolutionsController, type: :controller do
  
  let!(:example_with_no_type) { { a: 1, b: 1, c: 1, type: nil } }
  let!(:example_without_d_params) { { a: 1, b: 1, c: 1, type: 'sqrt' } }
  let!(:example_without_base_params) { { type: 'lin' } }
  let!(:example_with_good_params_lin) { { a: 1, b: 1, c: 1, type: 'lin' } }
  let!(:example_with_good_params_sqrt) { { a: 1, b: 1, c: 1, d: 1, type: 'lin' } }

  context 'render new solution with auth token' do
    
    before do
      check_auth(token: ENV['AUTH_TOKEN'])
    end

    it 'failed with bad params if type not "lin" or "sqrt"' do
      post :solve, params: example_with_no_type

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'failed if a, b, c params doesnt present' do
      post :solve, params: example_without_base_params

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'failed if type "sqrt" but "d" param doesnt present' do
      post :solve, params: example_without_d_params

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'success' do
      post :solve, params: example_with_good_params_lin

      expect(response).to have_http_status(:ok)
    end

    it 'success' do
      post :solve, params: example_with_good_params_sqrt
      
      expect(response).to have_http_status(:ok)
    end
  end

  it 'failed with no auth' do
    post :solve

    expect(response).to have_http_status(401)
  end
end
