--Load
os.loadAPI("ocs/apis/sensor")

--Peripheral var
m = peripheral.wrap("monitor_0")
tank_sensor = sensor.wrap("top")


--Init
for k,v in pairs(tank_sensor.getTargets()) do 
  if(k == "0,0,3") then tank_1 = v;
  elseif(k == "0,0,4") then tank_2 = v;
  elseif(k == "1,0,3") then tank_3 = v;
  elseif(k == "1,0,4") then tank_4 = v;
  end
end

print("Load tank : ", tank_1, "; ", tank_2, "; ", tank_3, "; ", tank_4, "; ")

totalCapacity = tank_1.Capacity + tank_2.Capacity + tank_3.Capacity + tank_4.Capacity
totalAmount = tank_1.Amount + tank_2.Amount + tank_3.Amount + tank_4.Amount
percent = (totalAmount/totalCapacity)*100

print("Capacity : ", totalCapacity)
print("Amount : ", totalAmount)
print("Ratio : ", percent, "%")
--Command for computer : openp/github run Hugome perso-script-tekkit master SecondaryNetwork/src/monitor_lava.lua