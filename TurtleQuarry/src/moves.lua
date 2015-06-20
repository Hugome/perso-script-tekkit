
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

function forwardTurtle()
  checkFuel()
  turtle.forward()
end

function downTurtle()
  checkFuel()
  turtle.down()
end
