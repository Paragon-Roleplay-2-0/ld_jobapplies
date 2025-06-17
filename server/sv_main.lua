RegisterServerEvent('ld_jobapplys:sendApply', function(input, type)
  local src = source
  local ped = GetPlayerPed(src)
  local pedCoords = GetEntityCoords(ped)
  local date = os.date('%m-%d-%Y')
  if input then
    if type == "police" then
      local embed = {
        {
          ["thumbnail"] = {
            ["url"] = "https://static.wikia.nocookie.net/alterlifepolicedepartement/images/5/51/R_%281%29.png/revision/latest?cb=20220111090530"
          },
          ["color"] = 255,
          ["title"] = 'LSPD Application',
          ["description"] = '**First & Last Name:** ' ..
              input[1] ..
              '\n **What\'s Your Age?:** ' ..
              input[2] ..
              '\n **Date of Birth:** ' ..
              date ..
              '\n **Your Character\'s Phone Number:** ' ..
              input[4] ..
              '\n **Gender:** ' ..
              input[5] ..
              '\n **Do you have prior experience in this field?:** ' ..
              input[6] ..
              '\n **Why do you want to become a police officer for the LSPD?:** ' ..
              input[7] .. '\n\n **Discord Username: **' .. input
              [8],
        }
      }

      PerformHttpRequest(Config.PDWebHook, function(err, text, headers) end, 'POST',
        json.encode({ username = name, embeds = embed }), { ['Content-Type'] = 'application/json' })
    elseif type == "ems" then
      local embed = {
        {
          ["thumbnail"] = {
            ["url"] =
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Star_of_life2.svg/1200px-Star_of_life2.svg.png"
          },
          ["color"] = 16711680,
          ["title"] = 'EMS Application',
          ["description"] = '**First & Last Name:** ' ..
              input[1] ..
              '\n **What\'s Your Age?:** ' ..
              input[2] ..
              '\n **Date of Birth:** ' ..
              date ..
              '\n **Your Character\'s Phone Number:** ' ..
              input[4] ..
              '\n **Gender:** ' ..
              input[5] ..
              '\n **Do you have prior experience in this field?:** ' ..
              input[6] ..
              '\n **Why do you want to become an EMT?:** ' .. input[7] .. '\n\n **Discord Username: **' .. input[8],
        }
      }

      PerformHttpRequest(Config.EMSWebHook, function(err, text, headers) end, 'POST',
        json.encode({ username = name, embeds = embed }), { ['Content-Type'] = 'application/json' })
    elseif type == "mechanic" then
      local embed = {
        {
          ["thumbnail"] = {
            ["url"] =
            "https://static.wikia.nocookie.net/logopedia/images/6/69/Los_Santos_Customs_%28Alt%29.png/revision/latest?cb=20221125234438"
          },
          ["color"] = 16776960,
          ["title"] = 'Mechanic Application',
          ["description"] = '**First & Last Name:** ' ..
              input[1] ..
              '\n **What\'s Your Age?:** ' ..
              input[2] ..
              '\n **Date of Birth:** ' ..
              date ..
              '\n **Your Character\'s Phone Number:** ' ..
              input[4] ..
              '\n **Gender:** ' ..
              input[5] ..
              '\n **Do you have prior experience in this field?:** ' ..
              input[6] ..
              '\n **Why do you want to become a mechanic?:** ' .. input[7] .. '\n\n **Discord Username: **' .. input[8],
        }
      }

      PerformHttpRequest(Config.MechanicWebHook, function(err, text, headers) end, 'POST',
        json.encode({ username = name, embeds = embed }), { ['Content-Type'] = 'application/json' })
    elseif type == "sheriff" then
      local embed = {
        {
          ["thumbnail"] = {
            ["url"] =
            "https://gta.fandom.com/wiki/Los_Santos_County_Sheriff?file=LSSD-GTAV-Logo.png"
          },
          ["color"] = 16744192,
          ["title"] = 'LSCSO Application',
          ["description"] = '**First & Last Name:** ' ..
              input[1] ..
              '\n **What\'s Your Age?:** ' ..
              input[2] ..
              '\n **Date of Birth:** ' ..
              date ..
              '\n **Your Character\'s Phone Number:** ' ..
              input[4] ..
              '\n **Gender:** ' ..
              input[5] ..
              '\n **Do you have prior experience in this field?:** ' ..
              input[6] ..
              '\n **Why do you want to become a deputy for the LSCSO?:** ' ..
              input[7] .. '\n\n **Discord Username: **' .. input[8],
        }
      }
      PerformHttpRequest(Config.SheriffWebhook, function(err, text, headers) end, 'POST',
        json.encode({ username = name, embeds = embed }), { ['Content-Type'] = 'application/json' })
    elseif type == "state" then
      local embed = {
        {
          ["thumbnail"] = {
            ["url"] =
            "https://nopixel.fandom.com/wiki/San_Andreas_State_Police/3.0?file=SASP3.png"
          },
          ["color"] = 0,
          ["title"] = 'SASP Application',
          ["description"] = '**First & Last Name:** ' ..
              input[1] ..
              '\n **What\'s Your Age?:** ' ..
              input[2] ..
              '\n **Date of Birth:** ' ..
              date ..
              '\n **Your Character\'s Phone Number:** ' ..
              input[4] ..
              '\n **Gender:** ' ..
              input[5] ..
              '\n **Do you have prior experience in this field?:** ' ..
              input[6] ..
              '\n **Why do you want to become a trooper for the SASP?:** ' ..
              input[7] .. '\n\n **Discord Username: **' .. input[8],
        }
      }
      PerformHttpRequest(Config.StateWebhook, function(err, text, headers) end, 'POST',
        json.encode({ username = name, embeds = embed }), { ['Content-Type'] = 'application/json' })
    end
  end
end)