require 'sinatra'
require 'pony'


Pony.options = {
  via: 'smtp',
  via_options: {
    address: 'smtp.mailgun.org',
    port: '587',
    enable_starttls_auto: true,
    authentication: 'plain',
    user_name: 'postmaster@sandboxc5dd2f3c6d4b44e5a5326c1f9326fc65.mailgun.org',
    password: '944964e9402addd80331083cec29622f-1053eade-57373eed'
  }
}

def send_email
  message = {
    from: 'example@hotmail.co.uk',
    to:'roisinwherry@hotmail.co.uk',
    subject: 'Welcome!',
    body: 'Thank you for signing up.'
  }

result=  Pony.mail(message)
puts result
end

get '/' do
  erb :index
end

post'/signup' do
  @name = params[:name]
  @email = params[:email]

  send_email

  erb :thanks
end
