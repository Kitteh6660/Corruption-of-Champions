package classes.Perks 
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.StatusEffects;
	
	public class AscensionFertilityPerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			return "(Rank: " + params.value1 + "/" + kGAMECLASS.charCreation.MAX_FERTILITY_LEVEL + ") Increases base fertility by " + params.value1 * 5 + ".";
		}
		
		public function AscensionFertilityPerk() 
		{
			super("Ascension: Fertility", "Ascension: Fertility", "", "Increases fertility rating by 5 per level.");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean 
		{
			return true;
		}		
	}

}
