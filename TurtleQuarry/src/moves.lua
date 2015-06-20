
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

function forwardTurtle()
  local retmove = false
  local i = 0
  while retmove == false do
    checkFuel()
    retmove = turtle.forward()
    if retmove == false then
      turtle.dig()
      turtle.attack()
    end
    if i >= 100 then
      exit()
    end
    i = i + 1
  end
end

function downTurtle() --Entity or block gene
  local retmove = false
  local i = 0
  while retmove == false do
    checkFuel()
    retmove = turtle.down()
    if retmove == false then
      turtle.digDown()
      turtle.attackDown()
    end
    if i >= 100 then
      exit()
    end
    i = i + 1
  end
end

function upTurtle() --Entity or block gene
  local retmove = false
  local i = 0
  while retmove == false do
    checkFuel()
    retmove = turtle.up()
    if retmove == false then
      turtle.digUp()
      turtle.attackUp()
    end
    if i >= 100 then
      exit()
    end
    i = i + 1
  end
end