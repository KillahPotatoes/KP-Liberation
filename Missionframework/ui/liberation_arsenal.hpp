class liberation_arsenal {
	idd = 5251;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","LoadoutList","EditButton","LoadButton", "RespawnButton", "TransferButton", "PlayersCombo", "ButtonClose"};

	objects[] = {};

	class RecycleBG : BgPicture {
		x = (0.17 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.1 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.16 * safezoneW) + (4 * BORDERSIZE);
		h = (0.75 * safezoneH) + (6 * BORDERSIZE);
	};

	class OuterBG : StdBG{
		colorBackground[] = COLOR_BROWN;
		x = (0.17 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.1 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.16 * safezoneW) + (4 * BORDERSIZE);
		h = (0.75 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F : OuterBG {
		style = ST_FRAME;
	};
	class InnerBG : OuterBG {
		colorBackground[] = COLOR_GREEN;
		x = (0.17 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = (0.15 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.16 * safezoneW) +  (2 * BORDERSIZE);
		h = (0.7 * safezoneH)  + (3 * BORDERSIZE);
	};
	class InnerBG_F : InnerBG {
		style = ST_FRAME;
	};
	class Header : StdHeader{
		x = 0.17 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.09 * safezoneH + safezoneY;
		w = 0.16 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_ARSENAL_TITLE;
	};
	class LoadoutList : StdListBox {
		idc = 201;
		x = 0.17 * safezoneW + safezoneX;
		w = 0.16 * safezoneW;
		y = 0.15 * safezoneH + safezoneY;
		h = (0.45 * safezoneH) - (1.5 * BORDERSIZE);
		shadow = 2;
		onLBSelChanged="";
	};
	class LoadButton : StdButton{
		idc = 202;
		x = (0.18 * safezoneW + safezoneX);
		y = (0.6 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.03 * safezoneH;
		text = $STR_LOAD_LOADOUT;
		action = "load_loadout = 1;";
	};
	class EditButton : StdButton{
		idc = -1;
		x = (0.18 * safezoneW + safezoneX);
		y = (0.65 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.03 * safezoneH;
		text = $STR_EDIT_LOADOUT;
		action = "edit_loadout = 1;";
	};
	class RespawnButton : StdButton{
		idc = -1;
		x = (0.18 * safezoneW + safezoneX);
		y = (0.7 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.024 * safezoneH;
		text = $STR_MAKE_RESPAWN_LOADOUT;
		action = "respawn_loadout = 1;";
	};
	class PlayersCombo : StdCombo{
		idc = 203;
		x = (0.18 * safezoneW + safezoneX);
		w = 0.14 * safezoneW;
		y = 0.75 * safezoneH + safezoneY;
		h = 0.04 * safezoneH;
		sizeEx = 0.02 * safezoneH;
	  };
	class TransferButton : StdButton{
		idc = 204;
		x = (0.18 * safezoneW + safezoneX);
		y = (0.8 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.024 * safezoneH;
		text = $STR_LOAD_PLAYER_LOADOUT;
		action = "load_from_player = lbCurSel 203;";
	};
	class ButtonClose : StdButton{
		idc = 101;
		x = 0.315 * safezoneW + safezoneX;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
		y = 0.095 * safezoneH + safezoneY;
		text = "X";
		action = "closeDialog 0";
	};

};