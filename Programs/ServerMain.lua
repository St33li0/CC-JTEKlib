require ".JTEK.Libraries.JTEKlib"

function serverHost(protocol)
    peripheral.find("modem", rednet.open)

    rednet.close
end