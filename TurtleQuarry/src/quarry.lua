--User set var
print("Longeur :")
height = tonumber(read())
print("Largeur :")
width = tonumber(read())

--Init functions
function installAndLoadFile(name)
  if fs.exists(name) then
    fs.delete(name)
  end
  shell.run("openp/github get Hugome perso-script-tekkit master TurtleQuarry/src/" .. name .. " " .. name)
  shell.run(name)
end

--Inits
installAndLoadFile("dig_one_level.lua")
installAndLoadFile("moves.lua")
installAndLoadFile("check_end.lua")

--Runs
z = 0
while isEndOfQuarry() == false do
  digOneLevel(width, height)
  if isEndOfQuarry() == false then
    if isReturnHome() then
      returnToHome(z)
      dropAllInventory()
      returnToCurrentZ(z)
    end
    downTurtle()
  end
  z = z + 1
end

returnToHome(z - 1)
dropAllInventory()

--Command for computer : openp/github run Hugome perso-script-tekkit master TurtleQuarry/src/quarry.lua
--Command for computer : openp/github get Hugome perso-script-tekkit master TurtleQuarry/src/quarry.lua startup