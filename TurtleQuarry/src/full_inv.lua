
function isReturnHome()
  local emptySlot = 0;
  for i=1, 16 do
    if(turtle.getItemCount(i) == 0) then emptySlot = emptySlot + 1 end
  end
  if(emptySlot <= 0)then return true
  else return false
  end
end

function returnToHome(z)
  for cz=1, z do
    upTurtle()
  end
end

function returnToCurrentZ(z)
  for cz=1, z do
    downTurtle()
  end
end

function dropAllInventory()
  turtle.turnLeft()
  turtle.turnLeft()
  for i=1, 16 do
    turtle.select(i)
    if (turtle.refuel(0) == false) then turtle.drop() end
  end
  turtle.turnLeft()
  turtle.turnLeft()
end