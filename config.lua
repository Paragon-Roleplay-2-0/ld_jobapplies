Config = Config or {}

Config.Target = "ox" -- qb / ox

Config.PDWebHook = " " -- Your webhook for police applications
Config.SheriffWebhook = " " -- Your webhook for sheriff applications
Config.StateWebhook = " " -- Your webhook for state police applications
Config.EMSWebHook = " " -- Your webhook for EMS applications
Config.MechanicWebHook = " " -- Your webhook for mechanic applications

Config.Applys = {
    -- [0] = {
    --     type = "Type of job - police/ems/mechanic",
    --     name = "Name for apply",
    --     label = "Label to display",
    --     coords = vector4(),
    --     ped = false/true,
    --     pedModel = "Ped model",
    -- },

    -- FOR EXAMPLE:
    [1] = {
        type = "police",
        name = "MRPD",
        label = "LSPD Application",
        coords = vector4(446.59, -985.64, 30.71, 88.84), -- kiiya mrpd
        ped = true,
        pedModel = "s_f_y_cop_01",
    },

    [2] = {
        type = 'sheriff',
        name = "LSCSO",
        label = "Sheriff's Department Application",
        coords = vector4(1818.54, 3672.53, 34.71, 118.56), -- g&n sheriff's department
        ped = true,
        pedModel = "s_f_y_sheriff_01",
    },

    [3] = {
        type = 'state',
        name = 'SASP',
        label = "State Police Application",
        coords = vector4(-585.9, -425.15, 35.17, 270.13), -- n-team police department
        ped = true,
        pedModel = "s_m_y_hwaycop_01",
    },

    [4] = {
        type = "ems",
        name = "Mount Zonah Medical Center",
        label = "EMS Application",
        coords = vector4(-437.46, -323.2, 34.91, 154.28), -- g&n mount zonah
        ped = true,
        pedModel = "s_f_y_scrubs_01",
    },

    [5] = {
        type = "mechanic",
        name = "Cruisin' Craftsmen",
        label = "Mechanic Application",
        coords = vector4(-329.09, -1336.45, 31.45, 268.07), --  n-team mechanic
        ped = true,
        pedModel = "s_m_m_autoshop_01",
    },
}