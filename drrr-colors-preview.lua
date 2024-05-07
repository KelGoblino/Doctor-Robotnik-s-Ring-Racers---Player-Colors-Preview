----------------------------------------------------------------------
-- Preview a sprite in the colors available in Dr Robotnik's Ring Racers palette.
-- By Pepperdork, 2021. Edited  by KelGoblino, 2124.
----------------------------------------------------------------------

--**************** 
--	GLOBAL VARIABLES 
--****************
local dlg = Dialog{title="Dr. Robotnik's Ring Racers Color Preview"}
local kartpal

-- Format: {Name, {Palette Values}}
local paletteTable = {
	{"White", {1,   1,   1,   1,   1,   2,   5,   8,   9,  11,  14,  17,  20,  22,  25,  28}}, 
	{"Silver", {1,   1 ,   2,   3,   5,   7,   9,  12,  13,  15,  18,  20,  23,  25,  27,  30}},
	{"Gray",{1 ,   3,   5,   7,   9,  11,  13,  15,  17,  19,  21,  23,  25,  27,  29,  31}},
	{"Nickel",{3,   5,   8,  11,  15,  17,  19,  21,  23,  24,  25,  26,  27,  29,  30,  31}},
	{"Black",{4,   7,  11,  15,  20,  22,  24,  27,  28,  28,  28,  29,  29,  30,  30,  31}},
	{"Skunk", {1, 1,   2,   3,   4,  10,  16,  21,  23,  24,  25,  26,  27,  28,  29,  31}},
	{"Fairy", {1, 1, 252, 252, 200, 201,  211,  14,  16,  18,  20,  22,  24,  26,  28,  31}},
	{"Popcorn", {1,  80,  80,  81,  82,  218,  240 ,  11,  13,  16,  18,  21,  23,  26,  28,  31}},
	{"Artichoke", {80, 88, 89, 98, 99, 91,  12,  14,  16,  18,  20,  22,  24,  26,  28,  31}},
	{"Pigeon", {1, 128, 129, 130, 146, 170,  14,  15,  17,  19,  21,  23,  25,  27,  29,  31}},
	{"Sepia", {1,   1,   3,   5,   7,   9,  241,  242,  243,  245,  247,  249,  236,  237,  238,  239}},
	{"Beige", {1,  208,  216,  217,  240,  241,  241,  243,  245,  247,  249,  250,  251,  237,  238,  239 }},
	{"Caramel", {208,   48,  216,  217,  218,  220,  221,  223,  224,  226,  228,  230,  232,  234 ,  236,  239  }},
	{"Peach", {1,  208,  48,  216,  218,  221,  212,  213,  214,  215,  206,  207,  197,  198,  199,  254 }},
	{"Brown", {216,  217,  219,  221,  224,  225,  227,  229,  230,  232,  234,  235,  237,  239,  29,  30}},
	{"Leather", {218, 221, 224, 227, 229, 231, 233, 235, 237, 239, 28, 28, 29, 29, 30, 31}},
	{"Pink",{1, 208, 208, 209, 209, 210, 211, 211, 212, 213, 214, 215, 41, 43, 45, 46}},
	{"Rose", {209, 210, 211, 211, 212, 213, 214, 215, 41, 42, 43, 44, 45, 71, 46, 47}}, 
	{"Cinnamon",{ 216,  221,  224,  226,  228,  60, 61, 43, 44, 45, 71, 46, 47, 29, 30,  31}},
	{"Ruby", {1, 208, 209, 210, 211, 213, 39, 40, 41, 43 , 186, 186, 169, 169,  253,  254}},
	{"Raspberry", {1, 208, 209, 210, 32, 33, 34, 35, 37, 39, 41, 43, 44, 45, 46, 47}}, 
	{"Red",{209, 210, 32, 34, 36, 38, 39, 40, 41, 42, 43, 44, 45, 71, 46, 47}},
	{"Crimson",{210, 33, 35, 38, 40, 42, 43, 45, 71, 71, 46 , 46, 47, 47, 30,  31}},
	{"Maroon", {32, 33, 35, 37, 39, 41, 43,  237,  26,  26,  27,  27,  28,  29,  30,  31}},
	{"Lemonade", {1, 80,  81,  82,  83,  216,  210, 211, 212, 213, 214, 215, 43, 44, 71, 47}},
	{"Scarlet", { 48, 49, 50,  51,  53,  34, 36, 38, 184, 185, 168, 168, 169, 169, 254, 31}},
	{"Ketchup", {72, 73, 64 ,  51,  52,  54,  34, 36, 38, 40, 42, 43, 44, 71, 46, 47,}},
	{"Dawn",{1, 208, 216, 209, 210, 211, 212,  57,  58,  59,  60, 61, 63, 71, 47, 31}},
	{"Sunslam ", {82, 72, 73,  64,  51,  53 ,  55, 213, 214, 195, 195, 173, 174, 175,  253,  254}},
	{"Creamsicle", {1, 1,  208,  208,  48,  49,  50,  52,  53,  54,  56,  57,  58, 60,  61,  63}},
	{"Orange", {208 ,  48,  49,  50,  51,   52,  53,  54,  55,  57,  59,  60, 62, 44, 71, 47}},
	{"Rosewood", {50,  52,  55,  56,  58,  59, 60, 61, 62, 63, 44, 45, 71, 46, 47, 30}},
	{"Tangerine", {80,  81, 82, 83, 64, 51,  52,  54,  55,  57,  58,  60,  61, 63, 71, 47}},
	{"Tan", {1,  80,  81,  82,  83,  84, 85, 86, 87, 245, 246, 248, 249,  251,  237,  239}},
	{"Cream", {1,  80,  80,  81,  81,  49,  51,  222,  224,  227,  230,  233,  236,  239,  29,  31}},
	{"Gold", {1,  80,  81, 83, 64, 65 , 66, 67, 68, 215, 69, 70, 44, 71, 46, 47 }},
	{"Royal", { 80, 81, 83, 64, 65,  223,  229, 196, 196, 197, 197, 198, 199,  29,  30,  31}},
	{"Bronze",{83, 64, 65, 66, 67, 215, 69, 70, 44, 44, 45, 71, 46, 47, 29, 31}},
	{"Copper", {1,  82, 64, 65, 67, 68, 70,  237,  239,  28,  28,  29,  29,  30,  30,  31}},
	{"Yellow", {1,  80,  81,  82, 83, 73, 84,  74, 64, 65, 66, 67, 68, 69, 70, 71}},
	{"Mustard", {80,  81,  82, 83, 64, 65, 65, 76, 76, 77, 77, 78, 79, 237, 239, 29 }},
	{"Banana", {80,  81,  83,  72, 73, 74, 75, 76, 77, 78, 79, 236, 237, 238, 239,  30}},
	{"Olive", {80,  82,  73, 74, 75, 76, 77, 78, 79, 236, 237, 238, 239, 28, 29, 31}},
	{"Crocodile",{1, 80, 81, 88, 88, 188, 189, 76, 76, 77, 78, 79, 236, 237,  238,  239}},
	{"Peridot ",{ 1, 80, 81, 88, 188, 189, 190, 191, 94, 94, 95, 95, 109, 110,  111,  31}},
	{"Vomit", {1, 208, 216, 209,  218,  51, 65, 76, 191, 191, 126, 143, 138, 175, 169, 254}},
	{"Garden", {81,  82, 83, 73, 64, 65, 66, 92, 92, 93, 93, 94, 95, 109, 110, 111}},
	{"Lime", {1,  81,  81,  88,  188, 189, 114, 114, 115, 115, 116, 116, 117, 118, 119,  111}},
	{"Handheld", {83, 72, 73, 74, 75, 76, 102, 104, 105, 106, 107, 108, 109, 110,  111,  31}},
	{"Tea", {1, 81, 81, 82, 88, 89, 90, 91, 92, 93, 94, 95, 109, 110, 111, 31}},
	{"Pistachio", {1, 80, 88, 88, 89, 90, 91, 102, 103, 104, 105, 106, 107, 108, 109, 110}},
	{"Moss", {88, 89, 90, 91, 91, 92, 93, 94, 107, 107, 108, 108, 109, 109 , 110, 111 }},
	{"Camouflage", {208,  84,  85,  240,  241,  243,  245,  94, 107, 108, 108, 109, 109, 110, 110, 111}}, 
	{"Mint", {1, 88, 88, 89, 89, 100, 101, 102, 125, 126, 143, 143, 138, 175, 169,  254}},
	{"Green", {96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111}},
	{"Pinetree", {97, 99, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,  29,  29,  30}},
	{"Turtle ", {96, 112, 112, 113, 113, 114, 114, 115, 115, 116, 116, 117, 117, 118, 119, 111 }},
	{"Swamp", {96, 112, 113, 114, 115, 116, 117, 118, 119, 119,  28,  28,  29,  29,  30,  30}},
	{"Dream", {1, 1,  208,  208,  48, 89, 98, 100, 148, 148, 172, 172, 173, 173, 174, 175}},
	{"Plague", {80, 88, 96, 112, 113, 124, 142, 149, 149, 173, 174, 175,  169,  253,  254,  30}},
	{"Emerald", {1, 120, 121, 112, 113, 114, 115, 125, 125, 126,  126,  127,  138,  175,  253,  254}},
	{"Algae", {128, 129, 130, 131, 132, 133, 134, 115, 115, 116, 116, 117, 118, 119,  110,  111}},
	{"Aquamarine", {1, 128, 120, 121, 122, 123, 124, 125, 126, 126, 127, 127, 118, 118, 119,  111}},
	{"Turquoise", {128,  120,  121,  122, 123, 141, 141, 142, 142, 143, 143, 138, 138, 139,  139,  30}},
	{"Teal", {1, 120, 120, 121, 140, 141, 142, 143, 143, 138, 138, 139, 139, 254, 254 , 30}},
	{"Robin", {1, 80, 81, 82, 83, 88 , 121, 140, 133, 133, 134, 135, 136, 137, 138, 139}},
	{"Cyan", {1, 1, 128, 128, 255, 131, 132, 134, 142, 142, 143, 127, 118, 119, 110, 111 }},
	{"Jawz",  {1, 1, 128, 128, 129, 146, 133, 134, 135, 149, 149, 173, 173, 174, 175, 30}},
	{"Cerulean", {1, 128, 129, 130, 131, 132, 133, 135, 136, 136, 137, 137, 138, 138, 139, 30 }},
	{"Navy", {128, 129, 130, 132, 134, 135, 136, 137, 137, 138, 138, 139,  139,  28,  29,  31}},
	{"Platinum", {1,   1,   1, 144, 144, 145,  9,  11,  14, 142, 136, 137, 138, 138, 139, 31}},
	{"Slate", {1, 1, 144, 144, 144, 145, 145, 145, 170, 170, 171, 171, 172, 173,  174, 175}},
	{"Steel", {1, 144, 144, 145, 145, 170, 170, 171, 171, 172, 172, 173, 173, 174, 175, 31}},
	{"Thunder", {  80,  81,  82, 83, 64, 65,  11, 171, 172, 173, 173, 157, 158, 159, 254, 31}},
	{"Nova", {1, 83,  49,  50,  51, 32, 192, 148, 148, 172, 173, 174, 175,  28,  29,  30}}, 
	{"Rust", {208,  48,  216,  217,  240,  241,  242, 171, 172, 173,  23,  24,  25,  27,  28,  30}},
	{"Wristwatch", {48,  218,  221,  224,  227,  231, 196, 173, 173, 174, 159, 159, 253, 253, 254, 30}},
	{"Jet", {145, 146, 147, 148, 149, 173, 173, 174, 175, 175, 27, 27, 28, 28, 29, 30}},
	{"Sapphire", {1 , 128, 129, 131, 133, 135, 149, 150, 152, 154, 156, 158, 159, 253, 254, 30}},
	{"Utramarine ", {1, 1,  120,  120,  121, 133, 135, 149, 149, 166, 166, 167, 168,  169,  254,  30}},
	{"Periwinkle", {1, 1, 144, 144, 145, 146, 147, 149, 150, 152, 154, 155, 157, 159, 253, 254}},
	{"Blue", {144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 155, 156, 158, 253, 254, 30}},
	{"Midnight", {146, 148,  149,  150,  152, 153, 155, 157, 159, 253, 253, 254, 254, 30,  30,  30}},
	{"Blueberry", {1, 144, 145, 146, 147, 171, 172, 166, 166, 167, 167, 168, 168,  175,  169,  253}},
	{"Thistle", {1, 1,  1,  252,  252, 160, 161, 162, 163, 164, 165, 166, 167,  168,  169,  254}},
	{"Purple", {1, 252, 160, 161, 162, 163, 164, 165, 166, 167, 168, 168, 169, 169,  253,  254}},
	{"Pastel", {1, 128, 128, 129, 129, 146, 170, 162, 163, 164, 165, 166, 167, 168, 169,  31}},
	{"Moonset", { 1, 144, 145, 146, 170, 162, 163, 184, 184, 207, 207, 44, 45, 46, 47,  30}},
	{"Dusk", {252 , 200, 201, 192, 193, 194, 172, 172, 173, 173, 174, 174, 175,  169,  253,  254}},
	{"Violet", {176,  177,  178, 179, 180, 181, 182, 183, 184, 165, 165, 166, 167, 168, 169,  254}},
	{"Magenta", {252, 200, 177, 177, 178, 179, 180, 181, 182, 183, 183, 184, 185, 186, 187,  30}},
	{"Fuchsia", {208, 209, 209, 32, 33, 182, 183, 184, 185, 185, 186, 186, 187, 253, 254, 30}},
	{"Toxic", {1, 1, 88, 88, 89,   6,   8,  10, 193, 194, 195, 173, 174, 175, 253, 254}},
	{"Mauve", {80,  81,  82, 83, 64,  50, 201, 192, 193, 194, 195, 173, 174, 175, 253, 254}},
	{"Lavender", {252, 177, 179, 192, 193, 194, 195, 196, 196, 197, 197, 198, 199, 29,  29,  30}},
	{"Byzantium", {145, 192, 193, 194, 195, 196, 197, 198, 199, 199,  28,  28,  29,  29,  30,  30}},
	{"Pomegranate", {208, 209, 210, 211, 212, 213, 214, 195, 195, 196, 196, 197, 198, 199,  28,  29}},
	{"Lilac", {1, 1, 1, 252, 252, 176, 200, 201, 179, 192, 193, 194, 195, 196, 197, 198}},
	{"Blossom", {1, 252, 252, 176, 177, 200, 201, 202, 202, 34, 36, 38, 40, 42,  45,  46}},
	{"Taffy", {1, 252, 252, 200, 200, 201, 202, 203, 204, 204, 205, 206, 207,  43,  45,  47}},
}
--------------------------------------

--**************** 
-- FUNCTIONS
--****************

----- HELPER FUNCTIONS
function alertUser(title, text)
	return app.alert{
		title=title,
		text=text
	}
end

function findColorInTable(index, table)  
    for i=0, #table do 
        if(table[i] == index) then return i end
    end 
    return nil
end

function validateFile(choice)
	local spr = app.activeSprite

	if #spr.cels == 0 then 
		alertUser("Warning", "This sprite has no cels.")
		return false 
	end

	if app.activeCel.image:isEmpty() then 
		alertUser("Warning", "The cel is empty.")
		return false 
	end

	if(choice == "SELECTION") then 
		if spr.selection.isEmpty then 
			alertUser("Warning", "You're not selecting anything.")
			return false
		end

	else
		if spr.colorMode ~= ColorMode.INDEXED then
			alertUser("Warning", "Make sure the sprite's color mode is set to Indexed. (Sprite -> Color Mode)")
			return false
		end
	end

	return true
end

function hasGreenPixels(image, pixels)

	local tempImage = image:clone()
	local foundPixel = false 

	for it in tempImage:pixels() do 
		if(findColorInTable(it(), pixels)) then
			foundPixel = true 
		end
	end
	return foundPixel
	
end

function parsePaletteFile() 
    -- Check the file and validate the palette.
    local tempPal = Palette{fromFile=dlg.data.kartpal}

    -- Kart has 256 colours by default. 
    -- 256-1 = 255
    if(#tempPal ~= 256) then 
		alertUser("Warning","Please select a Dr. Robotnik's Ring Racers palette.")
		dlg:modify {
            id="ok",
            enabled=false
        }
        dlg:show()
    else 
        -- app.activeSprite:setPalette(tempPal)
        kartpal = temp
        dlg:modify {
            id="ok",
            enabled=true
        }
        dlg:show()
    end
end
-------------------------

----- MAIN FUNCTION
function applyPalette(choice)

	-- Validate the sprite based off of the user's choice. 
	-- For example, using current selection. Are you even selecting anything?
	-- Or, using the current sprite, is the sprite empty?
	if(not validateFile(choice)) then 
		return
	end

    -- Close the dialog and let's do the thing.
	dlg:close()
	
	-- Range of colours in palette that are recolourable
	local greenArray = {96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111}
	
	-- Get the first frame (assuming its a green version of the character) and use this as a base.
	local baseImage = app.activeCel.image:clone()

	-- Selection? Or the whole sprite?
	if(choice == "SELECTION") then 
		local selection = app.activeSprite.selection
		app.command.Copy()
		
		local nSprite = Sprite(selection.bounds.width, selection.bounds.height, ColorMode.INDEXED)
		nSprite:setPalette(Palette{fromFile=dlg.data.kartpal})
		
		app.command.Paste()
		app.command.Cancel()

		baseImage = app.activeSprite.cels[1].image:clone()
	else
		app.activeSprite:setPalette(Palette{fromFile=dlg.data.kartpal})
	end

	-- Does the current image (selection/sprite) have ANY green pixels?
	if(not hasGreenPixels(baseImage, greenArray)) then 
		alertUser("Warning", "The selected sprite doesn't have any green pixels (Range 96 - 111). Please edit your sprite and try again.")
		return
	end
		
	-- Loop through all the colours, make a new frame, recolour the pixels and repeat.
	for i=1, #paletteTable do

        local colorName = paletteTable[i][1]
        local colorTable = paletteTable[i][2]

        local cel = app.activeSprite.cels[i]
        local tempImage = baseImage:clone()

        for it in tempImage:pixels() do
            local matchingColour = findColorInTable(it(), greenArray)
			if(matchingColour) then 
                it(colorTable[matchingColour])
            end
        end
		cel.image = tempImage

		if(paletteTable[i+1]) then
			app.command.MaskAll()
			app.command.Copy()

			app.activeSprite:newEmptyFrame()
			app.activeSprite:newCel(app.activeLayer, i+1)

			app.command.Paste()
			app.command.Cancel()

		end
	end

	-- And jump back to the beginning.
	app.command.GotoFirstFrame()

	alertUser("Notification", "And we're done!")
    app.refresh()
end
------------

if not app.activeSprite then 
	return alertUser("Warning", "There's no active sprite. Create a new one first.")
end
--------------------------------------

--**************** 
--	DIALOG SETUP
--****************

-- Path entry
dlg:file {
    id="kartpal",
    label="Palette File",
    title="Open Kart Palette",
    open=true,
    filename="Open file..",
    filetypes={"png","pal"},
    onchange=parsePaletteFile
}

-- Dropdown list
dlg:combobox {
	id="typelist",
	label="Selection",
	options={"Current Selection", "Whole Sprite"}
}

-- Description labels
dlg:label {
	id="currentsel",
	label="",
	text="Current Selection - Uses whatever you're selecting"
}
dlg:label {
	id="wholesprite",
	label="",
	text="Whole Sprite - Uses the entire sprite"
}
dlg:label {
	id="importantnote",
	label="",
	text="NOTE: The script will use the current cel/frame that you're on."
}

-- OK
dlg:button {
    id="ok",
    text="OK",
	onclick=(function()
		local choice = dlg.data.typelist == "Whole Sprite" and "SPRITE" or "SELECTION"
        app.transaction(
			function()
				applyPalette(choice)
		end)
    end)
}

-- Cancel
dlg:button {
    id="cancel",
	text="Cancel"
}

-- OK (Disable by default.)
dlg:modify {
    id="ok",
    enabled=false
}

-- And show.
dlg:show()
-- ****************
