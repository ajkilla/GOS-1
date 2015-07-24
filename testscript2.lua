local version = 1.34
OnLoop(function(myHero)
DrawText(string.format("currhp = %f", GetCurrentHP(myHero)),12,0,80,0xff00ff00);
end)
