function fightTimeBool = isFightTime( curTime, fightInitTime, fightFreq )
    if mod( curTime-fightInitTime, fightFreq ) == 0
        fightTimeBool = 1;
    else
        fightTimeBool = 0;
    end
end