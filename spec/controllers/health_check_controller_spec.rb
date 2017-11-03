require 'rails_helper'

RSpec.describe HealthCheckController, type: :controller do
  describe '#index' do
    it 'returns OK' do
      get :index
      expect(response.status).to eq 200
      expect(response.body).to eq 'OK'
    end
  end
end
