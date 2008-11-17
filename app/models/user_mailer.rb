class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = "http://87.101.88.105:1080/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://87.101.88.105:1080/"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "lostre@e-global.gr"
      @subject     = "[/lib/games/] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
