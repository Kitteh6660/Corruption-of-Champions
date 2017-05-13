package classes.Perks 
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.StatusEffects;
	
	public class AscensionFortunePerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			return "(Rank: " + params.value1 + ") Increases gems gained in battles by " + params.value1 * 10 + "%.";
		}
		
		public function AscensionFortunePerk() 
		{
			super("Ascension: Fortune", "Ascension: Fortune", "", "Increases gems gains by 10% per level.");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean 
		{
			return true;
		}		
	}

}
