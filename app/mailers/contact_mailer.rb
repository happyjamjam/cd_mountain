class ContactMailer < ApplicationMailer
  def send_when_admin_reply(user, contact)
  	@user = user
  	@answer = contact.reply_text
	mail to:      @user.email
         subject:'【CD MOUNTAIN】お問い合わせの回答。'
  end
end

# アドミンがコンタクトフォームに記入したものがユーザーに送られる場合はどうデータを引っ張ってくれば良い？