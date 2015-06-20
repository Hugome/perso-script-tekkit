--User set var
print("Longeur :")
height = tonumber(read())
print("Largeur :")
width = tonumber(read())

--Init functions
function installAndLoadFile(name)
  if fs.exists(name) then
    fs.delete(name)
  end
  shell.run("openp/github get Hugome perso-script-tekkit master TurtleQuarry/src/" .. name .. " " .. name)
  os.loadAPI(name)
end

--Inits
installAndLoadFile("dig_one_level.lua")
installAndLoadFile("moves.lua")
installAndLoadFile("check_end.lua")

--Functions
function isReturnHome()
  local emptySlot = 0;
  for i = 1, 16 do
    if(turtle.getItemCount(i) == 0) then emptySlot = emptySlot + 1 end
  end
  if(emptySlot <= 1)then return true
  else return false
  end
end

function checkFuel()
  if(turtle.getFuelLevel() > 10) then return end
  for i = 1, 16 do
    turtle.select(i)
    if turtle.refuel(0) then
      turtle.refuel(10)
      turtle.select(1)
      return
    end
  end
  turtle.select(1)
end

--Runs
z = 0
while isEndOfQuarry() == false do
  digOneLevel(width, height)
  downTurtle()
  z = z + 1
end

--Command for computer : openp/github run Hugome perso-script-tekkit master TurtleQuarry/src/quarry.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master TurtleQuarry/src/quarry.lua startup