local background = display.newRect(0,0,display.contentWidth,display.contentHeight);
background:setFillColor(1,1,1)
background.anchorX = 0; background.anchorY = 0;

_H = display.contentHeight;
_W = display.contentWidth;

-- load sounds
local sounds = {};
local soundName = {};
local soundIndex = 1;
local sound = audio.loadSound("SFX/AL.mp3");
table.insert(sounds, sound);
table.insert(soundName, "left");
local sound2 = audio.loadSound("SFX/AR.mp3");
table.insert(sounds, sound2);
table.insert(soundName, "right");
local sound3 = audio.loadSound("SFX/AM.mp3");
table.insert(sounds, sound3);
table.insert(soundName, "up");
local sound4 = audio.loadSound("SFX/CL.mp3");
table.insert(sounds, sound4);
table.insert(soundName, "left");
local sound5 = audio.loadSound("SFX/CR.mp3");
table.insert(sounds, sound5);
table.insert(soundName, "right");
local sound6 = audio.loadSound("SFX/CM.mp3");
table.insert(sounds, sound6);
table.insert(soundName, "up");
local sound7 = audio.loadSound("SFX/FL.mp3");
table.insert(sounds, sound7);
table.insert(soundName, "left");
local sound8 = audio.loadSound("SFX/FR.mp3");
table.insert(sounds, sound8);
table.insert(soundName, "right");
local sound9 = audio.loadSound("SFX/FM.mp3");
table.insert(sounds, sound9);
table.insert(soundName, "up");
local sound10 = audio.loadSound("SFX/GL.mp3");
table.insert(sounds, sound10);
table.insert(soundName, "left");
local sound11 = audio.loadSound("SFX/GR.mp3");
table.insert(sounds, sound11);
table.insert(soundName, "right");
local sound12 = audio.loadSound("SFX/GM.mp3");
table.insert(sounds, sound12);
table.insert(soundName, "up");

--stats
ptSounds = {};
local one = audio.loadSound("SFX/one.mp3");
table.insert(ptSounds, one);
local two = audio.loadSound("SFX/two.mp3");
table.insert(ptSounds, two);
local three = audio.loadSound("SFX/three.mp3");
table.insert(ptSounds, three);
local four = audio.loadSound("SFX/four.mp3");
table.insert(ptSounds, four);
local five = audio.loadSound("SFX/five.mp3");
table.insert(ptSounds, five);
local six = audio.loadSound("SFX/six.mp3");
table.insert(ptSounds, six);
local seven = audio.loadSound("SFX/seven.mp3");
table.insert(ptSounds, seven);
local eight = audio.loadSound("SFX/eight.mp3");
table.insert(ptSounds, eight);
local nine = audio.loadSound("SFX/nine.mp3");
table.insert(ptSounds, nine);
local ten = audio.loadSound("SFX/ten.mp3");
table.insert(ptSounds, ten);
local eleven = audio.loadSound("SFX/eleven.mp3");
table.insert(ptSounds, eleven);
local twelve = audio.loadSound("SFX/twelve.mp3");
table.insert(ptSounds, twelve);
local zero = audio.loadSound("SFX/zero.mp3");
table.insert(ptSounds, zero);
local neg = audio.loadSound("SFX/neg.mp3");
table.insert(ptSounds, neg);

percent = {};
local oneP = audio.loadSound("SFX/1.mp3");
table.insert(percent, oneP);
local twoP = audio.loadSound("SFX/2.mp3");
table.insert(percent, twoc);
local threeP = audio.loadSound("SFX/3.mp3");
table.insert(percent, threeP);
local fourP = audio.loadSound("SFX/4.mp3");
table.insert(percent, fourP);
local fiveP = audio.loadSound("SFX/5.mp3");
table.insert(percent, fiveP);
local sixP = audio.loadSound("SFX/6.mp3");
table.insert(percent, sixP);
local sevenP = audio.loadSound("SFX/7.mp3");
table.insert(percent, sevenP);
local eightP = audio.loadSound("SFX/8.mp3");
table.insert(percent, eightP);
local nineP = audio.loadSound("SFX/9.mp3");
table.insert(percent, nineP);
local tenP = audio.loadSound("SFX/10.mp3");
table.insert(percent, tenP);
local elevenP = audio.loadSound("SFX/11.mp3");
table.insert(percent, elevenP);
local twelveP = audio.loadSound("SFX/12.mp3");
table.insert(percent, twelveP);

otha = {};
local you = audio.loadSound("SFX/you.mp3");
table.insert(otha, you);
local pts = audio.loadSound("SFX/pts.mp3");
table.insert(otha, pts);
--local dbl = audio.loadSound("SFX/dbl.mp3");
--table.insert(otha, dbl);


local numSounds = table.getn(sounds);

local myText = display.newText( "Hello World", 0, 0, native.systemFont, 16 )
myText:setFillColor( 0, 0, 0 )
myText.anchorX = 0
myText.x = 10
myText.y = 40

local myScore = 0;
local score = display.newText( string.format("Score: %d/%d", myScore, numSounds), 0, 0, native.systemFont, 16 )
score:setFillColor( 0, 0, 0 )
score.anchorX = 0
score.x = 10
score.y = 500

local points=0;
local pts = display.newText( string.format("Points: %d", points), 0, 0, native.systemFont, 16 )
pts:setFillColor( 0, 0, 0 )
pts.anchorX = 0
pts.x = 100
pts.y = 500

local text = "none";

--swipe handler
local function handleSwipe( event )
    if ( event.phase == "moved" ) then
    	

        local dX = event.x - event.xStart;
        local dY = event.y - event.yStart;
        
        if ( dX > 30 and math.abs(dY) < 30) then
            --swipe right
            myText.text = "right";
            text = "right";
            lastSoundTime = time
            swipe();
        elseif ( dX < -30 and math.abs(dY) < 30) then
            --swipe left
            myText.text = "left";
            text = "left";
            swipe();
        elseif ( dY < -30 and math.abs(dX) < 30) then
        	--swipe up
        	myText.text = "up";
        	text = "up";
        	swipe();
        --[[
        elseif ( dY > 30 and math.abs(dX) < 30) then
        	--swipe down
        	myText.text = "down";
        	text = "down";
        	swipe();
        elseif ( dY > 20 and dX > 20) then
        	-- down right 
        	myText.text = "down right"
        	text = "down right";
        	swipe();
        elseif ( dY > 20 and dX < -20) then
        	-- down left
        	myText.text = "down left"
        	text = "down left";
        	swipe();
        elseif ( dY < -20 and dX > 20) then
        	-- down right 
        	myText.text = "up right"
        	text = "up right";
        	swipe();
        elseif ( dY < -20 and dX < -20) then
        	-- down left
        	myText.text = "up left"
        	text = "up left";
        	swipe();
        ]]--
        end
    end
    return true
end


-- game logic
local gameTimer;
local last = 0;
local i;
local start = false;

function swipe()
    print(start);
	if (soundIndex ~= last and soundIndex <= numSounds and start) then
		if (soundName[i] == text) then 
			myScore = myScore + 1
			score.text = string.format("Score: %d/%d", myScore, numSounds);
			points = points + 1;
			print("score!");
		else
			print("miss");
			points = points - 1;
			print(string.format("soundName: %s --- text: %s", soundName[i], text));
		end
		pts.text = string.format("Points: %d", points);
		last = soundIndex;
	end
end

local function increment()
	soundIndex = soundIndex + 1;
end

local function playsound()
	i = math.random(1,numSounds);
	audio.play(sounds[i]);
	gameTimer = timer.performWithDelay(1000, increment, 1);
	print("sound");
end

local function sayPts2()
	audio.play(otha[2]);
end

local function sayPts()
	if (points > 0) then
		audio.play(ptSounds[points]);
	elseif (points < 0) then
		audio.play(ptSounds[14]);
	else
		audio.play(ptSounds[13]);
	end
	--gameTimer = timer.performWithDelay(1000, sayPts2, 1);
end

local function sayScore()
	if (myScore) > 0 then
		audio.play(percent[myScore]);
	else
		audio.play(ptSounds[13]);
	end
end

local function sayEnd()
	--audio.play(otha[3]);
	local a = 0;
end

local function endGame()
	audio.play(otha[1]);
	gameTimer = timer.performWithDelay(1000, sayPts, 1);
	--gameTimer = timer.performWithDelay(7000, sayScore, 1);
	--gameTimer = timer.performWithDelay(7000, sayEnd, 1);
end

local function startgame()
	myScore = 0;
	soundIndex = 1;
	points = 0;
    start = true;
	score.text = string.format("Score: %d/%d", myScore, numSounds);
	pts.text = string.format("Points: %d", points);
	gameTimer = timer.performWithDelay(1000, playsound, numSounds);
	gameTimer = timer.performWithDelay(14000, endGame, 1);	
end

--reset tap handler
local function myTapListener( event )

    if ( event.numTaps == 2 ) then
        gameTimer = timer.performWithDelay(20, startgame, 1);
    else
        return true
    end
end

Runtime:addEventListener( "touch", handleSwipe )
Runtime:addEventListener( "tap", myTapListener )