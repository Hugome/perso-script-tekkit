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
for id_tank = 0, nb_tanks do
  local tank = tanks["tank_" .. id_tank]
  print(textutils.serialize(tank.Name))
end

--totalCapacity = tank_1.Capacity + tank_2.Capacity + tank_3.Capacity + tank_4.Capacity
--totalAmount = tank_1.Amount + tank_2.Amount + tank_3.Amount + tank_4.Amount
--percent = (totalAmount/totalCapacity)*100

--print("Capacity : ", totalCapacity)
--print("Amount : ", totalAmount)
--print("Ratio : ", percent, "%")
--Command for computer : openp/github run Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua startup