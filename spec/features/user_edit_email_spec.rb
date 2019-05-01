require 'rails_helper'

RSpec.feature "UserEditEmails", type: :feature do
  let!(:user){ FactoryBot.create(:user) }
end
