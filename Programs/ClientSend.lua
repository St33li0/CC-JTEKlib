require ".JTEK.Libraries.JTEKlib"

ID = ""

lightON = 98565
lightOFF = 98566

function clientSend(port,message)
    CHANNEL_BROADCAST = 98565
    peripheral.find("modem", rednet.open)
    rednet.broadcast(ID)
    rednet.close()
end

clientSend(lightON,"Test")
