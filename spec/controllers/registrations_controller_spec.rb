require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let(:user) { create :user }
  let(:user_update_params) do
    {
      name: user.name,
      email: user.email,
      phone: user.phone,
      email_notification: '0',
      current_password: user.password,
    }
  end

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'PUT #update' do
    subject(:update_account) { put :update, params: {user: user_update_params} }

    it 'updates the user account' do
      expect { update_account }.to change { user.reload.email_notification }.from(true).to(false)
    end

    it 'redirects to the landing page' do
      update_account
      expect(response).to redirect_to root_path
    end
  end
end
