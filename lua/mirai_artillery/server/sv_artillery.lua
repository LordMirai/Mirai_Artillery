
function MArti.Message(ply, txt, col)
    MArti.net.SendMessage(ply, text, col)
end

function MArti.Error(ply, txt)
    MArti.Message(ply, txt, MArit.Colors.Red)
end

function MArti.Success(ply, txt)
    MArti.Message(ply, txt, MArit.Colors.Green)
end

function MArti.Warning(ply, txt)
    MArti.Message(ply, txt, MArit.Colors.Orange)
end