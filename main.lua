function love.load()
	math.randomseed( os.time() )
	images = {
		orbiter = love.graphics.newImage("discovery-orbiter.png"),
		booster = love.graphics.newImage("discovery-solid_rocket_booster.png"),
		tank = love.graphics.newImage("discovery-external_fuel_tank.png"),
	}
	-- objects that have positions and need to be drawn
	visObjects = {
		orbiter = {
			img = images.orbiter,
			vis = true,
			pos = {368,536},
			rad = 0,
		},
		booster1 = {
			img = images.booster,
			vis = true,
			pos = {358,536},
			rad = 0,
		},
		booster2 = {
			img = images.booster,
			vis = true,
			pos = {378,536},
			rad = 0,
		},
		tank = {
			img = images.tank,
			vis = true,
			pos = {368,536},
			rad = 0,
		},
	}
	timer = {
		time = -20,
	}
	--[[ countdowns are the different stages in the game
		time = duration of countdown
		title gets shown to prepare the player 
		code gets executed at timer end + successful player reaction
	]]--
	countdowns = {
		{
			title = "Sound Supression System Activation!",
			time = 5,
			code = function()  end,
		},
		{
			title = "Sparks!",
			time = 5,
			code = function()  end,
		},
		{
			title = "Main Engines Start!",
			time = 5,
			code = function()  end,
		},
		{
			title = "Booster Ignition!",
			time = 5,
			code = function()  end,
		},
		{
			title = "Solid Rocket Booster Separation!",
			time = 10,
			code = function()  end,
		},
		{
			title = "Tank Separation!",
			time = 10,
			code = function()  end,
		},
		{
			title = "Docking Procedure!",
			time = 10,
			code = function()  end,
		},

	}
	--[[ countdowns have neither started nor finished 
		started = has started
		finished = has finished
	]]--
	for i,v in ipairs(countdowns) do
		countdowns[i].started = false
		countdowns[i].finished = false
	end
	-- initial background color
	love.graphics.setBackgroundColor( 40, 40, 80 )
end

function love.update(dt)

countdowns[5].code()
	
end

function love.draw(dt)
	for i,v in pairs(visObjects) do
		if v.vis then
			love.graphics.draw(v.img, v.pos[1], v.pos[2], v.rad)
		end
	end
end
