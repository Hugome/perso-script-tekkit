toBreak = 0
breaked = 0

-- Count obsidian to generate
for i = 1, 16 do
  local slotDetails = turtle.getItemDetail()
  turtle.select(i)
  if (slotDetails ~= nil and slotDetails.name == "minecraft:redstone") then
    toBreak = toBreak + turtle.getItemCount()
  end
end

-- Update monitor
function updateDisplay()
  local monitor = peripheral.wrap("top")
  local percent = (toBreak / breaked) * 100;
  monitor.clear()
  m.setCursorPos(1, 1)
  monitor.write("Obsidian :")
  m.setCursorPos(1, 2)
  monitor.write(percent .. "%")
end

-- Generate all obsi from 1 slot
function slotToObsi()
  local slotDetails = turtle.getItemDetail()
  while (slotDetails ~= nil and slotDetails.name == "minecraft:redstone" and turtle.getItemCount() > 0) do
  turtle.place()
  sleep(0.5)
  turtle.dig()
  breaked = breaked + 1
  end
end

-- Generate obsi from all slots of turtle
for i = 1, 16 do
  turtle.select(i)
  slotToObsi()
end
turtle.select(1)

--Command for computer : openp/github run Hugome perso-script-tekkit master ObsidianGenerator/src/obsidian_gen.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master ObsidianGenerator/src/obsidian_gen.lua startup

