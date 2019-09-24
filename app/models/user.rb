# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :subscriptions, dependent: :destroy

  # Dont include credit_card token when serialized
  def as_json(options = {})
    super(options.merge(except: :credit_card_token))
  end
end
