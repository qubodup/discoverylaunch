function love.load()
	math.randomseed( os.time() )
	-- objects; consist of image, visibility, position and 
	images = {
		orbiter = love.graphics.newImage("discovery-orbiter.png"),
		booster = love.graphics.newImage("discovery-solid_rocket_booster.png"),
		tank = love.graphics.newImage("discovery-external_fuel_tank.png"),
	}
	visObjects = {
		orbiter = {
			gfx = images.orbiter,
			vis = true,
			pos = {368,536},
			rad = 0,
		},
		booster1 = {
			gfx = images.booster,
			vis = true,
			pos = {358,536},
			rad = 0,
		},
		booster2 = {
			gfx = images.booster,
			vis = true,
			pos = {378,536},
			rad = 0,
		},
		tank = {
			gfx = images.tank,
			vis = true,
			pos = {368,536},
			rad = 0,
		},
	}
	timer = {
		time = -20,
	}
	-- countdowns have a time which they take to finish and title and code that get shown/executed at timer end + successful player reaction
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
			time = 20,
			code = function()  end,
		},

	}
	-- countdowns are not complete and not active by default
	for i,v in ipairs(countdowns) do
		countdowns[i].active = false
		countdowns[i].done = false
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
			love.graphics.draw(v.gfx, v.pos[1], v.pos[2], v.rad)
		end
	end
end
