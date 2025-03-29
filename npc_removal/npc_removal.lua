-- List of NPC models to remove (Firemen, Policemen, Paramedics, Military Personnel, and Gang Members)
local npcModels = {
    -- Emergency Services
    "s_m_y_fireman_01",        -- Fireman
    "s_m_y_cop_01",            -- Policeman
    "s_m_y_hwaycop_01",        -- Highway Cop
    "s_m_m_paramedic_01",      -- Paramedic
    "s_m_y_sheriff_01",        -- Sheriff
    "s_m_y_armymech_01",       -- Army Mechanic
    "s_m_y_armysoldier_01",    -- Army Soldier
    "s_m_y_armysoldier_02",
    "s_m_y_armysoldier_03",
    
    -- Gang Members
    "g_m_y_ballaeast_01",      -- Ballas Gang Member
    "g_m_y_ballaorig_01",
    "g_m_y_ballasout_01",
    "g_m_y_famca_01",          -- Families Gang Member
    "g_m_y_famdnf_01",
    "g_m_y_famfor_01",
    "g_m_y_lost_01",           -- The Lost MC Gang Member
    "g_m_y_lost_02",
    "g_m_y_lost_03",
    "g_m_y_mexgang_01",        -- Mexican Gang Member
    "g_m_y_mexgoon_01",
    "g_m_y_mexgoon_02",
    "g_m_y_mexgoon_03",
    "g_m_y_salvaboss_01",      -- Salvadoran Gang Leader
    "g_m_y_salvagoon_01",
    "g_m_y_salvagoon_02",
    "g_m_y_salvagoon_03",
    "g_m_y_strpunk_01",        -- Street Punk
    "g_m_y_strpunk_02"
}

-- Disable NPC spawning and remove unwanted NPCs
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Check for NPCs and remove them
        for _, ped in ipairs(GetGamePool('CPed')) do
            local model = GetEntityModel(ped)

            for _, npcModel in pairs(npcModels) do
                if model == GetHashKey(npcModel) then
                    DeleteEntity(ped)  -- Delete the NPC if it matches the model
                end
            end
        end
    end
end)
