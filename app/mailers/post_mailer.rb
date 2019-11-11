# frozen_string_literal: true

class PostMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.new_post.subject
  #
  def new_post(post)
    Rails.logger.info('inside mailer')
    # https://www.youtube.com/watch?v=9eFXEzOPRNs stuck on the PostMailer
    post = Post.last
    @post = post
    @user = post.user

    mail to: @user.email, subject: 'New post created'
  end
end
