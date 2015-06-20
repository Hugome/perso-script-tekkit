
function changeLine(x)
  if (((x + 1) % 2) == 1) then
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
  if ((width + 1) % 2) == 1 then
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
  for x=0, width do
    for y=0, height do
      checkEnd()
      turtle.digDown()
      if y < height - 1 then
        forwardTurtle()
      end
    end
    if x < width - 1 then
      changeLine(x)
    end
  end
  returnToStartPoint(width, height)
end
