## encoding: UTF-8
class NotificationMailer < ActionMailer::Base
  default from: "notificaciones@lubba.cl"
 
  def notification_email(email)
    @user = "user Osvaldo"
    @url  = 'http://www.invoicedigital.cl/page/index.html'
    attachments['DTE_77888630-8_33_2001_20141213T204055CEDIBLE.pdf'] = File.read("#{Rails.root}/public/uploads/documento/pdfs/DTE_77888630-8_33_2001_20141213T204055CEDIBLE.pdf")
    attachments['DTE_77888630-8_33_2001_20141213T204055.pdf'] = File.read("#{Rails.root}/public/uploads/documento/pdft/DTE_77888630-8_33_2001_20141213T204055.pdf")
    attachments['EnvioUnit_77888630-8_2001_20141213T114725.xml'] = File.read("#{Rails.root}/public/uploads/documento/fileEnvio/EnvioUnit_77888630-8_2001_20141213T114725.xml").force_encoding('iso-8859-1').encode('utf-8')

    mail(to: email, subject: 'Notificación InvoiceDigital')
  end

  def notification_email(email,id)
    doc = Documento.find(id)
    @user = doc.RznSocRecep
    @url  = 'http://www.invoicedigital.cl'
    attachments[doc.pdfs] = File.read("#{Rails.root}/public/uploads/documento/pdfs/#{doc.pdfs}")
    attachments[doc.pdft] = File.read("#{Rails.root}/public/uploads/documento/pdft/#{doc.pdft}")
    attachments[doc.fileCliente] = File.read("#{Rails.root}/public/uploads/documento/fileCliente/#{doc.fileCliente}").force_encoding('iso-8859-1').encode('utf-8')

    mail(to: email, subject: 'Intercambio Contribuyentes DTE InvoiceDigital')
  end

end
