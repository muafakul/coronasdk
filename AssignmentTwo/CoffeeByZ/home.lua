local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Loading widget module for buttons
local widget = require ('widget')

-- Loading helper
local helper = require ( "helper" )

local _W = display.contentWidth --Width and height parameters
local _H = display.contentHeight

function scene:createScene( event )
	local group = self.view
	
	-- create a background
	helper.drawBackground(group)
	
	-- Creating logo
	local logo =  display.newImageRect( "images/logo.png", 100, 20 )
	logo:setReferencePoint(display.CenterReferencePoint)
	logo.x, logo.y = display.contentCenterX, 100

	-- event listeners for buttons below
	local showView = function(event)
		storyboard.gotoScene( event.target.id )
	end

	-- Creating buttons, with my helper function.
	local buttonProducts, buttonAbout, buttonContact
	-- local createButton = function 		 (id, 			left, top, width, height, label, onevent, fontsize)
	buttonProducts 	= helper.createButton("products", 10, 250, _W-50, 40, "PRODUCTS", showView)
	buttonAbout 		= helper.createButton("about", 		10, 300, _W-50, 40, "ABOUT", 		showView)
	buttonContact 	= helper.createButton("products", 10, 350, _W-50, 40, "CONTACT", 	showView)
	
	-- all objects must be added to group (e.g. self.view)
	group:insert( logo )
	group:insert( buttonProducts )
	group:insert( buttonAbout )
	group:insert( buttonContact )
end

function scene:enterScene( event )
	local group = self.view
end

function scene:exitScene( event )
	local group = self.view
end

function scene:destroyScene( event )
	local group = self.view
end

-----------------------------------------------------------------------------------------

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene