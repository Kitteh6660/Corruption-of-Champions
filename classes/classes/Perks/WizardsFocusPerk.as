/**
 * Created by aimozg on 27.01.14.
 */
package classes.Perks
{
	import classes.StatusEffects;
	import classes.PerkClass;
	import classes.PerkType;

	public class WizardsFocusPerk extends PerkType
	{

		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			return "Increases your spell effect modifier by " + params.value1 * 100 + "%.";
		}

		public function WizardsFocusPerk()
		{
			super("Wizard's Focus", "Wizard's Focus",
					"Your wizard's staff grants you additional focus, reducing the use of fatigue for spells.");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean 
		{
			return true;
		}		
	}
}
