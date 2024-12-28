local net = net
MArti.net = MArti.net or {}


-- ! SENDING

MArti.net.SendMessage(ply, text, col)
    if (not IsValid(ply)) then
        return
    end

    text = string.Trim(text)
    if (text == "") then
        return
    end

    col = col or MArti.Colors.White

    net.Start("MArti_SendMessage")
    net.WriteString(text)
    net.WriteColor(col)
    net.SendToServer()
end


-- * RECEIVING
