
end_detected = false

function checkEnd()
  local data = turtle.inspectDown()
  if data.name == "minecraft:bedrock" then
    end_detected = true
  end
end

function isEndOfQuarry()
  return end_detected
end
