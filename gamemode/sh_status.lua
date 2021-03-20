-- Status Mapping

HORDE.Status_Camoflague = 0
HORDE.Status_Adrenaline = 1
HORDE.Status_Headhunter = 2

HORDE.Status_String = {}
HORDE.Status_String[HORDE.Status_Camoflague] = "Camoflague"
HORDE.Status_String[HORDE.Status_Adrenaline] = "Adrenaline"
HORDE.Status_String[HORDE.Status_Headhunter] = "Headhunter"

function HORDE:IsStatusStackable(status)
    if status == HORDE.Status_Adrenaline or status == HORDE.Status_Headhunter then return true end
    return false
end