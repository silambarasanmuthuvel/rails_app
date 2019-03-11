class EmailWorker
  include Sidekiq::Worker

  def perform(user,topic)
    @user=user
    @topic=topic
    UserMailer.welcome_email(@user,@topic).deliver
  end
end
