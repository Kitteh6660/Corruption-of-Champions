package classes.Scenes.NPCs
{
	import classes.*;
	import classes.GlobalFlags.kFLAGS;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.GlobalFlags.kACHIEVEMENTS;
	
	public class DollScene extends NPCAwareContent
	{
		public function DollScene() {}
			
		// Loss
		public function hypnotism():void
		{
			clearOutput();
			outputText("You fall to the ground, consumed with lust.");
			
			if (player.hasCock()) {
				outputText(" The doll's aura becomes a deep pink, and you feel a strange stirring within your body. It makes you want to fuck the doll...no, you NEED to fuck it, right now! You");
				if (player.armorName != "") outputText(" hastily strip off your " + player.armorName + " and");
				outputText(" find your " + player.cockDescript(0));
				if (player.cocks.length > 1) outputText("s");
				outputText(" throbbing with need. Without hesitation, you shove everything you have into the doll's unnaturally wide pussy.\n\nYou piston eagerly into the doll,");
				if (player.totalCockThickness() >= 7) outputText(" the sheer thickness stretching its opening and causing slight tears,");
				outputText(" desperate to fill the doll with your load. Its plush cunt feels amazing, incredibly soft and yet still grabbing hold of you with need. The strange and wonderful sensation consumes you, and you suddenly hit your limit, seed");
				if (player.cumQ() > 1000) outputText(" flooding into");
				else outputText(" spilling into");
				outputText(" it - and it seems like it's trying to hold it all in itself, as its pussy seals itself around your " + player.cockDescript(0));
				if (player.cocks.length > 1) outputText("s");
				outputText(".\n\nYou sigh with relief - but your lust just comes right back! You look hungrily once more at the doll, and it becomes apparent that the doll intends to make you fill it up completely with your cum.\n\nIt takes hours, the doll starting to bulge with weight and juices pouring out of it, but you finally calm down. You feel like you cummed more just now than you have in days...Filled with exhaustion, you immediately fall unconscious - and you swear you saw the doll give a sly smirk as your vision dims.");
				player.orgasm();
			}
			else {
				outputText(" The doll's aura becomes a deep pink, which turns to an angry red as it realizes you haven't even got something to fuck it with.");
			}
			combat.cleanupAfterCombat();
		}

		// Win
		public function victory():void {
			clearOutput();
			outputText("The doll's aura dissipates, its power apparently weakened.");
			removeButton(0);
			if (player.lust >= 33) {
				if (player.hasCock()) {
					outputText("\n\nIf you want to sate yourself, you could put your dick in the doll.");
					addButton(0, "DickFuck", dollDickFuck);
				}
				else {
					outputText("\n\nYou'd use it to sate your needs, but you haven't got the parts.");
				}
			}
			outputText("\n\nYou could take it back to camp with you, if you wanted.");
			addButtonDisabled(1, "Take", "Not currently implemented!");
			addButton(4, "Leave", combat.cleanupAfterCombat);
		}
		
		// Male victory fuck
		public function dollDickFuck():void {
			clearOutput();
			outputText(" You smile as you decide that you'll give the doll exactly what it wanted. You");
			if (player.armorName != "") outputText(" hastily strip off your " + player.armorName + " and");
			outputText(" find your " + player.cockDescript(0));
			if (player.cocks.length > 1) outputText("s");
			outputText(" throbbing with need. Without hesitation, you shove everything you have into the doll's unnaturally wide pussy.\n\nYou piston eagerly into the doll,");
			if (player.totalCockThickness() >= 7) outputText(" the sheer thickness stretching its opening and causing slight tears,");
			outputText(" prepared to fill the doll with your load. Its plush cunt feels amazing, incredibly soft and yet still grabbing hold of you with need. The strange and wonderful sensation consumes you, and you suddenly hit your limit, seed");
			if (player.cumQ() > 1000) outputText(" flooding into");
			else outputText(" spilling into");
			outputText(" it - and it seems like it's trying to hold it all in itself, as its pussy seals itself around your " + player.cockDescript(0));
			if (player.cocks.length > 1) outputText("s");
			outputText(". Too bad, as its exhaustion causes it to loosen up and spill out your juices. It seems upset, and you almost feel bad for the thing.\n\nYou sigh with relief, happy to have something to unload everything you have into without it complaining or asking to come home with you. Maybe if you find it again, you'll give it another go.")
			player.orgasm();
			combat.cleanupAfterCombat();
		}
		
		// Take doll
		public function takeDoll():void {
			outputText("");
			combat.cleanupAfterCombat();
		}
	}

}