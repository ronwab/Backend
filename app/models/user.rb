# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  after_create :signup_confirmation

  def signup_confirmation
    Rails.logger.info('jhere')
    UserMailer.signup_confirmation(self).deliver
  end
end
