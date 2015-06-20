
function checkFuel()
  if(turtle.getFuelLevel() > 10) then return end
  for i=1, 16 do
    turtle.select(i)
    if turtle.refuel(0) then
      turtle.refuel(10)
      turtle.select(1)
      return
    end
  end
  turtle.select(1)
end

function forwardTurtle() --Entity or block gene
  checkFuel()
  turtle.forward()
end

function downTurtle() --Entity or block gene
  checkFuel()
  turtle.down()
end

function upTurtle() --Entity or block gene
  checkFuel()
  turtle.up()
end