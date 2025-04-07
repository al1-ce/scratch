// Screen:
//     getTextScreenSize{w, h} - size of intermission screen
//     getViewWindow[x, y, w, h] - pos and size of view window
//     getWidth()/getHeight() - size of window

class CustomStatusBar: BaseStatusBar {
vector4 getElementTransform(vector2 pos) {
    int win_x, win_y, win_w, win_h;
    [win_x, win_y, win_w, win_h] = Screen.getViewWindow();

    int sb_limited = screenblocks <= 10 ? screenblocks : 10;

    vector2 hud_scale = getHUDScale();

    double sb_scale = sb_limited / 10.0;

    int pos_x = win_x / hud_scale.x + ( pos.x * sb_scale );
    int pos_y = win_y / hud_scale.y + ( pos.y * sb_scale );

    return (pos_x, pos_y, sb_scale, sb_scale);
}
}

class CustomHUD : CustomStatusBar {
	HUDFont mHUDFont;
	CustomPlayer pmo;

	override void init(void) {
		super.init();
		setSize(0, 320, 200);
		Font fnt = SmallFont;
		mHUDFont = HUDFont.create(fnt, fnt.getCharWidth("0"), Mono_CellLeft, 1, 1);
	}

	override void draw(int state, double delta) {
		if (CPlayer && CPlayer.mo) {
			pmo = CustomPlayer(CPlayer.mo);
		}

		BaseStatusBar.draw(state, delta);

		if (state == HUD_StatusBar || state == HUD_Fullscreen) {
			beginHUD(forcescaled: true);

			drawHealth();
		}
	}

	void drawHealth(void) {
        // LINK: https://zdoom.org/wiki/GZDoom
        // int screenblocks = CVar.getCVar("screenblocks").getInt();

        vector4 tr = getElementTransform((10, 10));

		drawString( mHUDFont, stringTable.Localize("$TXT_HUD_HEALTH") .. formatNumber(pmo.player.health, 3),
                    (tr.x, tr.y), scale: (tr.z, tr.w));
	}
}
