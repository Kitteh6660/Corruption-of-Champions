package classes.Perks 
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.StatusEffects;
	
	public class AscensionDesiresPerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			return "(Rank: " + params.value1 + "/" + kGAMECLASS.charCreation.MAX_DESIRES_LEVEL + ") Increases maximum lust by " + params.value1 * 5 + ".";
		}
		
		public function AscensionDesiresPerk() 
		{
			super("Ascension: Desires", "Ascension: Desires", "", "Increases maximum lust by 5 per level.");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean 
		{
			return true;
		}
	}

}
