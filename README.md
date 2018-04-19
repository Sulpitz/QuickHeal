# QuickHeal
QuickHeal for Vanilla WoW 1.12. with integration for HealComm (Luna unit Frames).

I'm not the author of QuickHeal.

I just did the implementation for QuckHeal to use Healcom to heal smarter.
I also did some other additions and improvements.

I got the original version of QuickHeal from https://wow.curseforge.com/projects/project-2800.

# Installation
- Download QuickHeal from this repository into your Interface folder and remove the "-master" in the folder name
- Download HealComm or Luna unit Frames: https://github.com/Aviana/LunaUnitFrames
- Download Bonusscanner (Makes QhickHeal and HealComm (Luna unit Frames) more accurate by taking gear and +Heal into account: http://www.vanilla-addons.com/dls/bonusscanner/

# What this version of QuickHeal does:

**Integration of HealComm**

- QuickHeal is now using the incomming heal information, broadcasted by HealComm (Luna unit Frames), through the addonchannel to reduce overhealing and making this addon used by multible raidmembers more effective.
- Also there is the option to downrank the spells being used, so healing can be more effitient.

**How to use**
- Find the original description here: https://wow.curseforge.com/projects/project-2800

- Help
"/qh help" displays all a

- Heal:
To do a heal make a macro with "/qh" or set Keybind:

![Keybind Quick Heal](https://www2.pic-upload.de/img/35189646/1.png)

- Downrank
To conserve mana and heal more effitiently you can limit the max rank that Quick Heal will use. It is done by moving the slider. on the Downrank Window. "/qh dr" to open the Downrank Window.
![Open Downrank Window](https://www2.pic-upload.de/img/35189791/2.png)
![Downrank Window](https://www2.pic-upload.de/img/35189979/3.png)

- Change Heal mode
There are 3 modes for healing.

"/qh hm 1" - Default
Priest: Will only cast Greater Heal, Heal and Lesser Heal.
Paladin: Will only use Flash of Light

"/qh hm 2" 
Priest: Will only cast Flash Heal
Paladin: Will only cast Holy Light
 
"/qh hm 3" - Most HPS
Will cast the heal with the most HPS.
Priest: Will cast Prayer of Healing if possible

The Heal mode can tbe set with macro or Key bind. The ">" indicate the selected mode.
![Keybinds Healmode](https://www2.pic-upload.de/img/35190067/4.png)

# Changes:

hc05: (get from Branch)
- Healmodes for Paladins and Priests now controll the spells used. See How to Use
- Priests: in healmode 3 Prayer of Heal is cast if possible

hc04:
- new command: /qh healpct - Will prioritise the player with the lowest percentage of health. (override changes of hc03, where priests heal the target with the most healing needed and paladins the lowest target)


hc03:
- /qh downrank or /qh dr toggles a window where the maximum spell rank to be used for healspells can be set. (hold rightclick on frame to drag the window)
- Keybind for toggeling downrank window
- /qh toggle will change between Flash heals and Normal heals on Priest
- Keybind to toggle between Flash heals and Normal heals on Priest
- Heal sent from other players via HealComm will now be considered in selv preservation
- Heal sent from other players via HealComm will now be considered for player that is target of target prioity healing
- Priests will now heal the player with the most health missing
- Paladin will now heal the player with the lowest amount of health
- For Paladins healing out of fight will now use the same spells as infight
