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
		},
		booster1 = {
			img = images.booster,
		},
		booster2 = {
			img = images.booster,
		},
		tank = {
			img = images.tank,
		},
	}
	--[[ countdowns are the different stages in the game
		time = duration of countdown
		title gets shown to prepare the player 
		code gets executed at timer end + successful or failing player reaction
	]]--
	countdowns = {
		{
			title = "Sound Supression System Activation!",
			time = 5,
			code = {
				success = function() end,
				failure = function() end,
			},
		},
		{
			title = "Sparks!",
			time = 5,
			code = {
				success = function() end,
				failure = function() end,
			},
		},
		{
			title = "Main Engines Start!",
			time = 5,
			code = {
				success = function() end,
				failure = function() end,
			},
		},
		{
			title = "Booster Ignition!",
			time = 5,
			code = {
				success = function() timers.ingame.started = true end,
				failure = function() end,
			},
		},
		{
			title = "Solid Rocket Booster Separation!",
			time = 10,
			code = {
				success = function() end,
				failure = function() end,
			},
		},
		{
			title = "Tank Separation!",
			time = 10,
			code = {
				success = function() end,
				failure = function() end,
			},
		},
		{
			title = "Docking Procedure!",
			time = 10,
			code = {
				success = function() end,
				failure = function() end,
			},
		},

	}
	-- levels are just different time lengths
	levels = {
		nub = 1,
		mid = 0.5,
		pro = 0.1,
	}
	-- debug
	level = "nub"
	gameStart()
end

function gameStart()
	-- various timers
	timers = {
		game = {
			time = 0,
			started = true,
		},
		-- gets shown as soon as boosters start
		ingame = {
			time = 0,
			started = false,
		},
		-- current countdown timer
		countdown = {
			time = 5,
			started = true,
		}
	}
	--[[ countdowns have neither started nor finished 
		started = has started
		finished = has finished
	]]--
	for i,v in ipairs(countdowns) do
		countdowns[i].started = false
		countdowns[i].finished = false
	end
	-- currently executed countdown
	countdownCurrent = 1
	-- visObjects are visible (vis) and not rotated (rad) and have no usable position (pos) yet
	for i,v in pairs(visObjects) do
		visObjects[i].vis = true
		visObjects[i].rad = 0
		visObjects[i].pos = {}
	end
	-- visObjects positionsReset
	visObjects.orbiter.pos  = {368,536}
	visObjects.booster1.pos = {358,536}
	visObjects.booster2.pos = {378,536}
	visObjects.tank.pos     = {368,536}
	-- initial background color
	love.graphics.setBackgroundColor( 40, 40, 80 )
end

function love.update(dt)
	-- timer updates
	for i,v in pairs(timers) do
		if v.started then
			timers[i].time = v.time - dt
			-- visual timer for drawing
			timers[i].visible = string.format("%03.2f", v.time)
		end
	end
end

function love.draw(dt)
	for i,v in pairs(visObjects) do
		if v.vis then
			love.graphics.draw(v.img, v.pos[1], v.pos[2], v.rad)
		end
	end
	-- drawing in-game timer
	if timers.ingame.started then love.graphics.print(timers.ingame.visible, 80, 32) end
	-- draw counter texts
	if timers.countdown.time <= 3 then
		love.graphics.print(countdowns[countdownCurrent].title ..
			string.format("\n%01.2f",timers.countdown.time) ..
		"\nPress SPACE when timer reaches Zero!", 80, 64)
	end
end

function love.keypressed(key, unicode)
	-- quit
	if key == 'escape' or key == 'q' then love.event.push('q') end
	-- in-game key presses
	if key == ' ' and countdownCurrent then
		if timers.countdown.time <= levels[level] and timers.countdown.time >= - levels[level] then
			countdowns[countdownCurrent].code.success()
			if not (countdownCurrent == #countdowns) then countdownCurrent = countdownCurrent + 1 end
			timers.countdown.time = countdowns[countdownCurrent].time
			print("success")
		else
			print("fail")
		end
	end
end
