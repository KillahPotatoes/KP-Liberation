


//________________  Author : [GR]GEORGE F ___________ 05.04.18 _____________

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


// Please keep the Credits or add them to your Diary
if (!local player) exitWith {};

waitUntil {!isNull player};
//credits
_subject = player createDiarySubject ["GF Earplugs Script", "GF Earplugs Script"];
_log_briefing = player createDiaryRecord ["GF Earplugs Script", ["About and Credits", "

<br /><font size='30' color='#FF0000'>GF Earplugs Script
<br />
<br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
<br />
<br />
<br /><font size='15' color='#FF0000'>V e r s i o n    1 . 0
<br />
<br /><font size='17' color='#0059B0'>GF Earplugs Script
<br />
<br />
<br /><font size='15' color='#A1D2FA'>GF Earplugs Script , mute or lower sound , with a key interaction , configurable key bindings.
<br />
<br />
<br />You are free to do anything but 
<br />i would like to give me Credits for this!
<br />
<br />Simple and easy to use and adapt .
<br />
<br />
<br />Thanks to All script contributors .
<br />Thanks to everyone who tries to do the best for this game!
<br />Thanks to Armaholic Community and Forums .
<br />Thanks to BIS for such a great platform.
<br />Thanks to BIS Community and BIS Community Forums
<br />
<br />
<br />Available at :
<br />Armaholic and Bohemia Interactive Forums 
<br />
<br />
<br /><font size='20' color='#FF0000'>Have Fun !
"
]];