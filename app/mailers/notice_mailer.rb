class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_slide.subject
  #
  def sendmail_slide(slide)
    @slide = slide

    mail to: "zgmf.x09a3999@gmail.com",
         subject: 'Slide On Medicalに新しく投稿がありました'
  end
end
