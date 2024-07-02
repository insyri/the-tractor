local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
  print('Logged in as ' .. client.user.username)
end)

client:on('messageCreate', function(message)
  if message.content == '!ping' then
    message.channel:send('YOU ARE A REAL KING, GG')
  end
end)

client:run('Bot ')
