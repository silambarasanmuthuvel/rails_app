class DeviceController < ApplicationController
  def device_detect
    puts request.env['HTTP_USER_AGENT']
    if request.env['HTTP_USER_AGENT'].downcase.match(/iphone/)
      redirect_to "https://www.apple.com/in/ios/app-store/"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/android/)
      redirect_to "https://play.google.com/store?hl=en"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/linux/)
      redirect_to "https://snapcraft.io/store"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/windows/)
      redirect_to "https://www.microsoft.com/en-in/store/apps/"
    else
      redirect_to "https://www.google.com/"
    end
  end
end
