--Load
os.loadAPI("ocs/apis/sensor")

--Peripheral var
local m = peripheral.wrap("monitor_0")
local tank_sensor = sensor.wrap("top")


--Init
for k,v in pairs(tank_sensor.getTargets()) do 
  if(k == "0,0,3") then local tank_1 = v;
  elseif(k == "0,0,4") then local tank_2 = v;
  elseif(k == "1,0,3") then local tank_3 = v;
  elseif(k == "1,0,4") then local tank_4 = v;
  end
end

print("Load tank : ", tank_1, "; ", tank_2, "; ", tank_3, "; ", tank_4, "; ")