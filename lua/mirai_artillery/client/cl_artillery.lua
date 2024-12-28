function MArti.Message(text, col, full)
    local header = full and "[Mirai Artillery] " or "[MArti] "
    chat.AddText(MArti.Config.PrimaryColor, header, col, text)
end

function MArti.Error(txt)
    MArti.Message(txt, MArit.Colors.Red)
end

function MArti.Success(txt)
    MArti.Message(txt, MArit.Colors.Green)
end

function MArti.Warning(txt)
    MArti.Message(txt, MArit.Colors.Orange)
end