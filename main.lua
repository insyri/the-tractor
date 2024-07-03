local discordia = require('discordia')
local client = discordia.Client()
local token = require("./token.lua")

local dcmd = require("discordia-slash")

client:on('ready', function()
  print('Logged in as ' .. client.user.username)
end)

local fban_list = {}

client:on('messageCreate', function(message)
  
  if message.content == '!ping' then
    message.channel:send('YOU ARE A REAL KING, GG')

  elseif message.content == '!fban list' then

    local total = ""
    for _, v in pairs(fban_list) do
      total = total .. " " .. v
    end
    message.channel:send(total)

  elseif message.content:sub(1, 9) == '!fban add' then

    local userID = message.content:sub(11)

    if #userID ~= 18 or userID == "" then
      message.channel:send("Please enter a valid user ID (18 digits)")
    else
      table.insert(fban_list, userID)
      message.channel:send("Added " .. userID .. " into fban list")
    end

  elseif message.content:sub(1, 5) == "!echo" then
    local echoText = message.content:sub(7)
    message.channel:send(echoText)
  end
end)


client:run('Bot ' .. token)
