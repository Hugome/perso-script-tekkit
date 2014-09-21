--Load
os.loadAPI("ocs/apis/sensor")

--Utils
function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

--Peripheral var
m = peripheral.wrap("monitor_1")
tank_sensor = sensor.wrap("top")



while true do
  --Update
  local totalCapacity = 0
  local totalAmount = 0
  for pos, target in pairs(tank_sensor.getTargets()) do 
    if(pos == "0,0,3" or pos == "0,0,4" or pos == "1,0,3" or pos == "1,0,4") then
      local tank = tank_sensor.getTargetDetails(pos)
      totalCapacity = totalCapacity + tank.Tanks[1].Capacity
      totalAmount = totalAmount + tank.Tanks[1].Amount
    end
  end
  local percent = (totalAmount/totalCapacity)*100
  
  --Graphics update
  m.clear()
  m.setCursorPos(1, 1)
  m.write(" Stockage de lave")
  m.setCursorPos(1, 2)
  m.write("Stockage: " .. totalCapacity .. "mB")
  m.setCursorPos(1, 3)
  m.write("Rempli: " .. totalAmount .. "mB")
  m.setCursorPos(1, 4)
  m.write("Plein a " .. (round(percent, 2)) .. "%")
  sleep(0.5)
end

--Command for computer : openp/github run Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua startup