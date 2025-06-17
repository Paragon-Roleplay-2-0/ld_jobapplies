CreateThread(function()
    for k, v in pairs(Config.Applys) do
        if Config.Target == "ox" then
            local ox_target = exports.ox_target
            ox_target:addBoxZone({
                name = v.name,
                coords = v.coords,
                size = vector3(3.0, 1.5, 3.0),
                rotation = 0.0,
                debug = false,
                options = {
                    {
                        onSelect = function()
                            TriggerEvent('ld_jobapplys:openApply', v.type)
                        end,
                        icon = 'fa-solid fa-clipboard-list',
                        label = 'Job Application',
                        distance = 3.0
                    }
                }
            })
        elseif Config.Target == "qb" then
            local qb_target = exports['qb-target']
            qb_target:AddBoxZone(v.name, vector3(v.coords.x, v.coords.y, v.coords.z - 1), 1, 1, {
                name = v.name,
                heading = v.coords.w,
                debugPoly = false,
                minZ = v.coords.z - 1,
                maxZ = v.coords.z + 1,
            }, {
                options = {
                    {
                        name = 'v.name',
                        action = function()
                            TriggerEvent('ld_jobapplys:openApply', v.type)
                        end,
                        icon = 'fa-solid fa-clipboard-list',
                        label = "Job Application",
                    }
                },
                distance = 3.0
            })
        end

        if v.ped then
            local modelHash = GetHashKey(v.pedModel)
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Wait(1)
            end
            local ped = CreatePed(1, modelHash, v.coords.x, v.coords.y, v.coords.z - 1, v.coords.w, false, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
        end
    end
end)

RegisterNetEvent('ld_jobapplys:openApply', function(type)
    if type == "ems" then
        local input = lib.inputDialog('Application for EMS', {
            { type = 'input',  label = 'First & Last Name:', description = 'Your Name Here...', required = true },
            { type = 'number', label = 'What\'s Your Age?', description = 'Your Age Here..', required = true },
            { type = 'date',   label = 'Date Of Birth:', icon = 'fa-solid fa-calendar-days', format = "MM/DD/YYYY", required = true },
            { type = 'input',  label = 'Your Character\'s Phone Number:', description = 'Your Character\'s Phone Number Here...', required = true },
            {
                type = 'select',
                label = 'Gender:',
                options = {
                    { value = 'Male',   label = 'Male' },
                    { value = 'Female', label = 'Female' }
                },
                required = true
            },
            {
                type = 'select',
                label = 'Do You Have Any Prior Experience in This Field?',
                options = {
                    { value = 'Yes',  label = 'Yes' },
                    { value = 'No',   label = 'No' },
                    { value = 'Some', label = 'Some' }
                },
                required = true
            },
            { type = 'textarea', label = 'Why Do You Want to Become an EMT?', required = true, min = 10, max = 500 },
            { type = 'input',    label = 'Discord Username:', required = true },
        })

        TriggerServerEvent('ld_jobapplys:sendApply', input, "ems")
    elseif type == "police" then
        local input = lib.inputDialog('Application for the LSPD', {
            { type = 'input',  label = 'First and Last Name:', description = 'Your Name Here...', required = true },
            { type = 'number', label = 'What\'s Your Age?', description = 'Your Age Here...', required = true },
            { type = 'date',   label = 'Date Of Birth:', icon = 'fa-solid fa-calendar-days', format = "MM/DD/YYYY", required = true },
            { type = 'input',  label = 'Your Character\'s Phone Number:', description = 'Your Character\'s Phone Number Here...', required = true },
            {
                type = 'select',
                label = 'Gender',
                options = {
                    { value = 'Male',  label = 'Male' },
                    { value = 'Female', label = 'Female' }
                },
                required = true
            },
            {
                type = 'select',
                label = 'Do You Have Any Prior Experience in This Field?',
                options = {
                    { value = 'Yes',  label = 'Yes' },
                    { value = 'No',   label = 'No' },
                    { value = 'Some', label = 'Some' },
                },
                required = true
            },
            { type = 'textarea', label = 'Why Do You Want to Become a Police Officer for the LSPD?', required = true, min = 10, max = 500 },
            { type = 'input',    label = 'Discord Username:', required = true },
        })

        TriggerServerEvent('ld_jobapplys:sendApply', input, "police")
    elseif type == "mechanic" then
        local input = lib.inputDialog('Application to be a Mechanic', {
            { type = 'input',  label = 'First & Last Name:', description = 'Your Name Here...', required = true },
            { type = 'number', label = 'What\'s Your Age?', description = 'Your Age Here..', required = true },
            { type = 'date',   label = 'Date Of Birth:', icon = 'fa-solid fa-calendar-days', format = "MM/DD/YYYY", required = true },
            { type = 'input',  label = 'Your Character\'s Phone Number:', description = 'Your Character\'s Phone Number Here...', required = true },
            {
                type = 'select',
                label = 'Gender',
                options = {
                    { value = 'Male',   label = 'Male' },
                    { value = 'Female', label = 'Female' }
                },
                required = true
            },
            {
                type = 'select',
                label = 'Do you have prior experience in this field?',
                options = {
                    { value = 'Yes', label = 'Yes' },
                    { value = 'No',  label = 'No' },
                    { value = 'Some', label = 'Some' }
                },
                required = true
            },
            { type = 'textarea', label = 'Why do you want to become a mechanic?', required = true, min = 10, max = 500 },
            { type = 'input',    label = 'Discord Username:', required = true },
        })

        TriggerServerEvent('ld_jobapplys:sendApply', input, "mechanic")
    elseif type == 'sheriff' then
        local input = lib.inputDialog('Application for the LSCSO', {
            { type = 'input',  label = 'First and Last Name:', description = 'Your Name Here...', required = true },
            { type = 'number', label = 'What\'s Your Age?', description = 'Your Age Here...', required = true },
            { type = 'date',   label = 'Date Of Birth:', icon = 'fa-solid fa-calendar-days', format = "MM/DD/YYYY", required = true },
            { type = 'input',  label = 'Your Character\'s Phone Number:', description = 'Your Character\'s Phone Number Here...', required = true },
            {
                type = 'select',
                label = 'Gender',
                options = {
                    { value = 'Male',   label = 'Male' },
                    { value = 'Female', label = 'Female' }
                },
                required = true
            },
            {
                type = 'select',
                label = 'Do You Have Any Prior Experience in This Field?',
                options = {
                    { value = 'Yes',  label = 'Yes' },
                    { value = 'No',   label = 'No' },
                    { value = 'Some', label = 'Some' },
                },
                required = true
            },
            { type = 'textarea', label = 'Why Do You Want to Become a Deputy for the LSCSO?', required = true, min = 10, max = 500 },
            { type = 'input',    label = 'Discord Username:', required = true },
        })

        TriggerServerEvent('ld_jobapplys:sendApply', input, "sheriff")
    elseif type == "state" then
        local input = lib.inputDialog('Application for the SASP', {
            { type = 'input',  label = 'First and Last Name:', description = 'Your Name Here...', required = true },
            { type = 'number', label = 'What\'s Your Age?', description = 'Your Age Here...', required = true },
            { type = 'date',   label = 'Date Of Birth:', icon = 'fa-solid fa-calendar-days', format = "MM/DD/YYYY", required = true },
            { type = 'input',  label = 'Your Character\'s Phone Number:', description = 'Your Character\'s Phone Number Here...', required = true },
            {
                type = 'select',
                label = 'Gender',
                options = {
                    { value = 'Male',   label = 'Male' },
                    { value = 'Female', label = 'Female' }
                },
                required = true
            },
            {
                type = 'select',
                label = 'Do You Have Any Prior Experience in This Field?',
                options = {
                    { value = 'Yes',  label = 'Yes' },
                    { value = 'No',   label = 'No' },
                    { value = 'Some', label = 'Some' },
                },
                required = true
            },
            { type = 'textarea', label = 'Why Do You Want to Become a Trooper for the SASP?', required = true, min = 10, max = 500 },
            { type = 'input',    label = 'Discord Username:', required = true },
        })

        TriggerServerEvent('ld_jobapplys:sendApply', input, "state")
    end
end)