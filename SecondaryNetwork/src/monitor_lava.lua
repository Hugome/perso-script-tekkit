--Load
os.loadAPI("ocs/apis/sensor")

--Peripheral var
m = peripheral.wrap("monitor_1")
tank_sensor = sensor.wrap("top")


oldpercent = 0;
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
  m.write("Plein a " .. (math.floor(percent)) .. "%")
  m.setCursorPos(1, 5)
  m.write("Tendance: ")
  if(percent > oldpercent)then m.write("Hausse")
  elseif(percent < oldpercent)then m.write("Baisse")
  else m.write("Stable")
  end
  oldpercent = percent
  sleep(0.5)
end

--Command for computer : openp/github run Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua startup