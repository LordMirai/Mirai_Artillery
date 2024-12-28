local net = net

-- ! SENDING







-- * RECEIVING

net.Receive("MArti_SendMessage", function()
    local text = net.ReadString()
    local col = net.ReadColor()

    MArti.Message(text, col)
end)