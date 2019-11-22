# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  # has_many :gardens

  after_create :signup_confirmation

  # sends email confirmation
  def signup_confirmation
    Rails.logger.info('here')
    UserMailer.signup_confirmation(self).deliver
  end
end
