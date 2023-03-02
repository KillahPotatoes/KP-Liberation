


//________________  Author : [GR]GEORGE F ___________ 05.04.18 _____________
//________________  Editor : T. Valentine ___________ 28.02.23 _____________

/*
________________ GF Earplugs Script ________________

https://forums.bohemia.net/forums/topic/215844-gf-earplugs-script/?tab=comments#comment-3281261

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /* 
means that it is disabled , so there is no need to delete the extra lines. 

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain collours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing . 
*/


/*
You can search here for key bindings :
https://community.bistudio.com/wiki/DIK_KeyCodes

DIK_6               0x07
DIK_TAB             0x0F
DIK_END				0xCF

*/


[]	spawn {
	waitUntil {!isNull(findDisplay 46)};

	(findDisplay 46) displayAddEventHandler ["KeyDown", {
	if(_this select 1 == 0xCF) // key 6		DIK_END 
	then {
	_Earplugs_ctrl = (_this select 0) displayCtrl 9001;
	if(isNull(_Earplugs_ctrl)) then {
	_Earplugs_ctrl = (_this select 0) ctrlCreate ["RscText", 9001];
	_Earplugs_ctrl ctrlShow false;	
	};
	_shown = ctrlShown _Earplugs_ctrl;
	
	0.1 fadeSound	
	(if(_shown)then{
		
	//________________ Weapon at the back ________________			
	//you can add your own display notification	here	
	
	titleText ["<t color='#339933' size='2'font='PuristaBold'>EARPLUGS OUT</t>", "PLAIN DOWN", -1, true, true];
	titleFadeOut 1.8;
	1
	}else{
			
	//________________ Weapon in hands ________________			
	//you can add your own display notification	here
	
	titleText ["<t color='#FF3333' size='2'font='PuristaBold'>EARPLUGS IN</t>", "PLAIN DOWN", -1, true, true];
	titleFadeOut 1.8;
	0.1
	}); 
				
	_Earplugs_ctrl ctrlShow !_shown;
	};
}];
};