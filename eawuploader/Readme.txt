SteamWorkshopUploader by nihilocrat

https://github.com/nihilocrat/SteamWorkshopUploader

A generic, bare-bones app made in Unity3D for letting players upload mods to Steam Workshop 
for your game. Unfortunately, this is not something Valve provides a tool for; you can modify 
existing Workshop items but you can't actually create them or upload content for them without 
using the Steam API. The uploader saves you from that hassle.

Thanks goes to rlabrecque, none of this would work without Steamworks.NET.




******************************************
************ How to Upload. **************
******************************************



1) Launch uploader.exe
2) Enter an Item name above the "Create Item" button.  
3) Press the Create Item button.
4) If successful quit the uploader. (Important as uploader will overwrite the json file on exit)
5) Find the newly created Item folder(in the WorkshopContent folder) and fill it with your mod content.
6) Edit the Item.workshop.json file and fill in the appropriate settings.  See SampleWS.workshop.json for an example.
	Note: Make sure to tag your item appropriately(ie: FOC for mods that only work on FOC) so they show up in
	the right game.
7) Launch uploader.exe again.
8) Pick your item.  Verify that the preview image is working and content folder is correct.
9) Update the Visibility and Change note as desired.
10) Press the Submit button.
11) Verify that Status says "SUCCESS! Item submitted! :D :D :D"
12) If this is your first submit to this workshop you'll need to login to the workshop on a web browser and agree
	to the "Terms and Conditions" of the steam workshop license agreement.  Once agreed you can try to press
	the Submit button again and hope it works.