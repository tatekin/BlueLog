require 'rails_helper'

feature 'Log', type: :feature do
  let(:user) { create(:user) }

  scenario 'ログ作成（統合テスト）' do
    visit root_path
    expect(page).to have_no_content('ログ作成')

    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ログ作成')

    expect {
      click_link('ログ作成')
      expect(current_path).to eq new_log_path
      fill_in 'log_place', with: '三宅島'
      find('input[type="submit"]').click
    }.to change(Log, :count).by(1)
  end
end