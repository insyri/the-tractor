local discordia = require('discordia')
local client = discordia.Client()
local token = require("./token.lua")

--[[
local CLIENT = client:useApplicationCommands()
local tools = require("discordia-slash").util.tools()
local dcmd = require("discordia-slash")
]]--

local fban_list = {}

client:on('ready', function()
  print('Logged in as ' .. client.user.username)
--[[
   -- gets a list of registered application commands from discord bot
   local commands = CLIENT:getGlobalApplicationCommands()
   -- deletes any existing application command from the bot's commands list
   for commandId in pairs(commands) do
     CLIENT:deleteGlobalApplicationCommand(commandId)
   end
 
   local slashCommand = {}
   local option = {}
   
   slashCommand = tools.slashCommand("Elite is gay!", "Sends your very own 'Elite is gay' message!")

   option = tools.string("elite_gay_message", "Choose your Elite is gay message!")

    option = option:addChoice(tools.choice("Elite is gay", "elite_gay1"))
    option = option:addChoice(tools.choice("Elite is really gay 2", "elite_gay2"))
    option = option:addChoice(tools.choice("Elite is super gay", "elite_gay3"))

    option = option:setRequired(true)

    slashCommand = slashCommand:addOption(option)

    CLIENT:createGlobalApplicationCommand(slashCommand)

    CLIENT:info("Ready!") ]]--
end)

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

--[[
-- command ban
{
  ["name"] = "",
  ["args"] = {
    ["1"] = {
      ["type"] = "mention",
      ["required"] = true
    },
    -- ["2"] = {
    --   ["type"] = "mention",
    --   ["required"] = true
    -- },
  }
}


local function isDigitsOnly(str)
  return string.match(str, "^%d+$") ~= nil
end


-- !fban add 123

function traverseCommands(commands, ctx)
  -- ctx = fban add 123
  local start_index, _ = string.find(ctx, " ")
  local extract = ctx:sub(1, start_index) -- extract = "fban"

  if commands[extract] ~= nil then
    local rest_of_command = ctx:sub(start_index + 1) -- "add 123"
    traverseArguments(commands[extract]["_args"], rest_of_command)
  end
end

function traverseArguments(arguments, ctx)
  -- ctx = add 123
  local si1, _ = string.find(ctx, " ")
  local extract = ctx:sub(1, si1) -- add

  if arguments[extract] ~= nil then
    local rest_of_command = ctx:sub(si1 + 1) -- "123"  
    local si2, _ = string.find(ctx, " ") -- fix
    local the_argument_as_txt = rest_of_command:sub(si2) -- "123"

    -- add the rest of the types and how to confirm if they are true.
    if arguments[extract]["type"] == "integer" then
      if isDigitsOnly(the_argument_as_txt) then
        
        local arg = tonumber(the_argument_as_txt)

        -- pass function

        -- fban_add(arg)

        -- 1. know if we are supposed to continue parsing
        --    (how does the structure tell us that there is another one?)
        -- 2. we need to continue parsing if so

    end
  end
end

-- function fban_add(userid)
  
-- end

function()
  local msg = "asdasd"

  if msg:sub(1, 2) == "!" then

    local commands = {
      ["mute"] = {
        ["_args"] = {
          ["recipient"] = {
            ["_type"] = "mention",
            ["_required"] = true
          }
        }
      },
      ["fban"] = {
        ["list"] = {},
        ["add"] = {
          ["_args"] = {
            ["recipient"] = {
              ["_type"] = "mention",
              ["_required"] = true
            }
          }
        },
        ["remove"] = {
          ["_args"] = {
            ["recipient"] = {
              ["_type"] = "mention",
              ["_required"] = true
            }
          }
        }
      }
    }

    local index1 = 2
    local lookup_scope = commands
    while true do

      local start_index, end_index = string.find(msg, " ")
      local extract = msg:sub(index1, start_index)

      -- test `extract` against list of commands.

      if lookup_scope[extract] ~= nil then
        lookup_scope = lookup_scope[extract]
        -- exists in the table
      else
        -- does not exist
      end

      index1 = start_index
    end
  end
end
]]--

--[[
CLIENT:on("slashCommand", function(interaction, command, args)
  
  if command.name == "Elite is gay!" then
    if args.elite_gay_message == "elite_gay1" then
      interaction:reply("Elite is gay")
    elseif args.elite_gay_message == "elite_gay2" then
      interaction:reply("Elite is really gay!")
    elseif args.elite_gay_message == "elite_gay3" then
      interaction:reply("Elite is super gay!")
    end

  end
end)
]]--

client:run('Bot ' .. token)
