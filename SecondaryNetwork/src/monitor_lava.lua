--Load
os.loadAPI("ocs/apis/sensor")

--Peripheral var
m = peripheral.wrap("monitor_0")
tank_sensor = sensor.wrap("top")


--Init
tanks = {}
nb_tanks = 0


for pos, target in pairs(tank_sensor.getTargets()) do 
  if(pos == "0,0,3" or pos == "0,0,4" or pos == "1,0,3" or pos == "1,0,4") then
    local id = "tank_" .. nb_tanks
    tanks[id] = tank_sensor.getTargetDetails(pos)
    nb_tanks = nb_tanks + 1
  end
end

print("Load tank : ")
for id_tank = 0, (nb_tanks - 1) do
  local tank = tanks["tank_" .. id_tank]
  print(textutils.serialize(tank.Name) .. " id => tank_" .. id_tank)
end

while true do
  --Update
  local totalCapacity = 0
  local totalAmount = 0
  for id_tank = 0, (nb_tanks - 1) do
    local tank = tanks["tank_" .. id_tank]
    totalCapacity = totalCapacity + tank.Tanks[1].Capacity
    totalAmount = totalAmount + tank.Tanks[1].Amount
  end
  local percent = (totalAmount/totalCapacity)*100
  
  --Graphics update
  m.clear()
  m.setCursorPos(1, 1)
  m.write("Réseau secondaire, stockage de lave")
  m.setCursorPos(1, 2)
  m.write("Capacité : " .. totalCapacity .. " mB")
  m.setCursorPos(1, 3)
  m.write("Rempli : " .. totalAmount .. " mB")
  m.setCursorPos(1, 4)
  m.write("Plein a " .. percent .. " %")
end


--print("Capacity : ", totalCapacity)
--print("Amount : ", totalAmount)
--print("Ratio : ", percent, "%")
--Command for computer : openp/github run Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua startup