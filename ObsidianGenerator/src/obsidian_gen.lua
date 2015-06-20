toBreak = 0
breaked = 0

redstone.setOutput("left", false)
-- Count obsidian to generate
for i = 1, 16 do
  local slotDetails = turtle.getItemDetail()
  turtle.select(i)
  if (slotDetails ~= nil and slotDetails.name == "minecraft:redstone") then
    toBreak = toBreak + turtle.getItemCount()
    slotDetails = turtle.getItemDetail()
  end
end

-- Update monitor
function updateDisplay()
  local monitor = peripheral.wrap("top")
  local percent = (breaked / toBreak) * 100;
  monitor.clear()
  monitor.setCursorPos(1, 1)
  monitor.write("Obsidian :")
  monitor.setCursorPos(1, 2)
  monitor.write(percent .. "%")
end

-- Generate all obsi from 1 slot
function slotToObsi()
  local slotDetails = turtle.getItemDetail()
  while (slotDetails ~= nil and slotDetails.name == "minecraft:redstone" and turtle.getItemCount() > 0) do
  redstone.setOutput("left", false)
  turtle.place()
  redstone.setOutput("left", true)
  sleep(3.5)
  redstone.setOutput("left", false)
  turtle.dig()
  breaked = breaked + 1
  updateDisplay()
  slotDetails = turtle.getItemDetail()
  end
end

-- Generate obsi from all slots of turtle
for i = 1, 16 do
  turtle.select(i)
  slotToObsi()
end
redstone.setOutput("left", false)
turtle.select(1)

--Command for computer : openp/github run Hugome perso-script-tekkit master ObsidianGenerator/src/obsidian_gen.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master ObsidianGenerator/src/obsidian_gen.lua startup

