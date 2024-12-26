MArti.GUI = {}
MArti.GUI.Common = {}

function MArti.GUI.Common.CreateButton(parent, x, y, w, h, onClick)
    if not IsValid(parent) then return end

    local button = vgui.Create("DButton", parent)
    button:SetPos(x, y)
    button:SetSize(w, h)
    button.DoClick = onClick
    return button
end
