package classes.Perks 
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.StatusEffects;
	
	public class AscensionTolerancePerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			return "(Rank: " + params.value1 + "/" + kGAMECLASS.charCreation.MAX_TOLERANCE_LEVEL + ") Increases corruption tolerance by " + params.value1 * 5 + " and reduces corruption requirement by " + params.value1 * 5 + ".";
		}
		
		public function AscensionTolerancePerk() 
		{
			super("Ascension: Corruption Tolerance", "Ascension: Corruption Tolerance", "", "Increases corruption tolerance by 5 per level and reduces corruption requirement by 5 per level.");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean 
		{
			return true;
		}		
	}

}
