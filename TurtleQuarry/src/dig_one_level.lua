
function changeLine(x)
  if ((x % 2) == 1) then
    turtle.turnLeft();
    forwardTurtle()
    turtle.turnLeft();
  else
    turtle.turnRight();
    forwardTurtle()
    turtle.turnRight();
  end
end

function returnToStartPoint(width, height)
  if (width % 2) == 1 then
    turtle.turnLeft();
    turtle.turnLeft();
    for y=0, height do
      forwardTurtle()
    end
  end
  turtle.turnLeft();
  for x=0, width do
    forwardTurtle()
  end
  turtle.turnLeft();
end

function digOneLevel(width, height)
  for x=1, (width + 1) do
    for y=1, (height + 1) do
      checkEnd()
      turtle.digDown()
      if y < height then
        forwardTurtle()
      end
    end
    
    if x < width then
      changeLine(x)
    end
  end
  returnToStartPoint(width, height)
end
