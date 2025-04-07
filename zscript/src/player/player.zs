class CustomPlayer : PlayerPawn {
	default {
		speed 1;
		health 100;
		radius 16;
		height 56;
		mass 100;
		painChance 255;
		player.displayName "MyStandAloneGamePlayer";
		player.crouchSprite "PLYC";
		player.colorRange 144, 189;
		player.colorset 0, "$TXT_COLOR_GREEN", 144, 191, 144;
		player.colorset 1, "$TXT_COLOR_RED", 96, 143, 96;
		player.colorset 2, "$TXT_COLOR_BLUE", 192, 239, 192;
	}

	states {
        spawn:
            PLAY A -1;
            loop;
        see:
            PLAY ABCD 4;
            loop;
        missile:
            PLAY A 12;
            goto Spawn;
        melee:
            PLAY A 6 BRIGHT;
            goto Missile;
        pain:
            PLAY A 4;
            PLAY A 4 a_pain();
            goto Spawn;
        death:
            PLAY A 0 a_playerSkinCheck("AltSkinDeath");
        death1:
            PLAY A 10;
            PLAY A 10 a_playerScream();
            PLAY A 10 a_noBlocking();
            PLAY AAA 10;
            PLAY A -1;
            stop;
        xDeath:
            PLAY A 0 a_playerSkinCheck("AltSkinXDeath");
        xDeath1:
            PLAY A 5;
            PLAY A 5 a_xScream();
            PLAY A 5 a_noBlocking();
            PLAY AAAAA 5;
            PLAY A -1;
            stop;
        altSkinDeath:
            PLAY A 6;
            PLAY A 6 a_playerScream();
            PLAY AA 6;
            PLAY A 6 a_noBlocking();
            PLAY AAA 6;
            PLAY A -1;
            stop;
        altSkinXDeath:
            PLAY A 5 a_playerScream();
            PLAY A 0 a_noBlocking();
            PLAY A 5 a_skullPop();
            PLAY AAAAAA 5;
            PLAY A -1;
            stop;
	}
}
