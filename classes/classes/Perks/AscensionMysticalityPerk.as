package classes.Perks 
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.StatusEffects;
	
	public class AscensionMysticalityPerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			return "(Rank: " + params.value1 + "/" + kGAMECLASS.charCreation.MAX_MYSTICALITY_LEVEL + ") Increases spell effect multiplier by " + params.value1 * 5 + "% multiplicatively.";
		}

		public function AscensionMysticalityPerk() 
		{
			super("Ascension: Mysticality", "Ascension: Mysticality", "", "Increases spell effect multiplier by 5% per level, multiplicatively.");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean 
		{
			return true;
		}		
	}

}
