-- Author: Cory Meeks
-- Date: Sept 1, 2016
-- Language: Lua
-- Description: Piece of component code bound to Color_Clock.ini,
--   a Rainmeter widget. This code is designed to take the given
--   time and return a variable within the Color_Clock.ini to 
--   change the background of the widget.
-- 

function Initialize()
	hoursMeasure = SKIN:GetMeasure('MeasureHours')
	minutesMeasure = SKIN:GetMeasure('MeasureMinutes')
	secondsMeasure = SKIN:GetMeasure('MeasureSeconds')
	hours = 0
	minutes = 0
	seconds = 0
	modulus = 0
	colorClock = "nil"
end

function Update()
	
	if hours == nil then
		--Empty
	else if hours % 2 == 0 then
		hours = hoursMeasure:GetValue()
		modulus = 0
	else
		hours = hoursMeasure:GetValue()
		modulus = 100
	end
	end
	
	if minutes == nil then
		--Empty
	else
		minutes = minutesMeasure:GetValue()
	end
	
	if seconds == nil then
		--Empty
	else
		seconds = secondsMeasure:GetValue()
	end
	
	hours = hours + modulus
	minutes = minutes + modulus
	seconds = seconds + modulus
	
	colorClock = SKIN:Bang("!SetVariable red " .. tostring(hours))
	colorClock = SKIN:Bang("!SetVariable green " .. tostring(minutes))
	colorClock = SKIN:Bang("!SetVariable blue " .. tostring(seconds))
	return colorClock
end