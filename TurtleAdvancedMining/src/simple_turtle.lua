--Peripheral var
print("Longeur du tunnel (forcez un peu elle revient toute seul : ")
longeur_tunnel = tonumber(read())
digged_tunnel = 0

--Functions
function getRestToDig()
  return (longeur_tunnel - digged_tunnel)
end


function checkFuel()
  if(turtle.getFuelLevel() > getRestToDig()+10) then return end
  for i = 1, 16 do
    turtle.select(i)
    if turtle.refuel(0) then
      turtle.refuel(10)
    end
  end
end

function whileDig()
  while (turtle.detect()) do
    turtle.dig() 
    sleep(0.3)
  end
end

function whileDigUp()
  while (turtle.detectUp()) do
    turtle.digUp()
    sleep(0.3)
  end
end

function digOneTranche()
  checkFuel()
  whileDig()
  turtle.forward()
  local function digLeftRight()
    turtle.turnLeft()
    whileDig()
    turtle.turnRight()
    turtle.turnRight()
    whileDig()
    turtle.turnLeft()
  end
  digLeftRight()
  whileDigUp()
  turtle.up()
  digLeftRight()
  turtle.down()
  digged_tunnel = digged_tunnel + 1
end

while (longeur_tunnel > digged_tunnel) do
  digOneTranche()
  sleep(0.5)
end

--Command for computer : openp/github run Hugome perso-script-tekkit master TurtleAdvancedMining/src/simple_turtle.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master TurtleAdvancedMining/src/simple_turtle.lua startup