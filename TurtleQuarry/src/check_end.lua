
end_detected = false

function checkEnd()
  local sucess, data = turtle.inspectDown()
  if sucess and data.name == "minecraft:bedrock" then
    end_detected = true
  end
end

function isEndOfQuarry()
  return end_detected
end
