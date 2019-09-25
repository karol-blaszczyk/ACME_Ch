# frozen_string_literal: true

require 'rails_helper'

describe 'rake payments:charge', type: :task do
  it 'preloads environment' do
    expect(task.prerequisites).to include 'environment'
  end
  it 'works with no users' do
    expect { task.execute }.not_to raise_error
  end

  context 'with billable users' do
    let!(:billable_users) { create_list(:user, 3, billing_day: Date.today.day) }
    let!(:non_billable_users) { create_list(:user, 2, billing_day: Date.tomorrow.day) }

    it 'runs a charge job only for billable users' do
      billable_users.each do |user|
        expect(UserChargeJob).to receive(:perform_later).with(user).ordered
      end

      non_billable_users.each do |user|
        expect(UserChargeJob).not_to receive(:perform_later).with(user)
      end
      task.execute
    end
  end
end
