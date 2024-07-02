local discordia = require('discordia')
local client = discordia.Client()
local token = require("./token.lua")

local dcmd = require("discordia-slash")

client:on('ready', function()
  print('Logged in as ' .. client.user.username)
end)

local fban_list = { "12345", "90210" }

client:on('messageCreate', function(message)
  
  if message.content == '!ping' then
    message.channel:send('YOU ARE A REAL KING, GG')

  elseif message.content == '!fban list' then

    local total = ""
    for _, v in pairs(fban_list) do
      total = total .. ", " .. v
    end
    message.channel:send(total)

  elseif message.content == '!fban add' then

  end
end)


client:run('Bot ' .. token)
