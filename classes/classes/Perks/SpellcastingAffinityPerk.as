/**
 * Created by aimozg on 27.01.14.
 */
package classes.Perks
{
	import classes.StatusEffects;
	import classes.PerkClass;
	import classes.PerkType;

	public class SpellcastingAffinityPerk extends PerkType
	{

		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			return "Reduces spell costs by " + params.value1 + "%.";
		}

		public function SpellcastingAffinityPerk()
		{
			super("Spellcasting Affinity","Spellcasting Affinity", "Reduces spell costs.");
		}
	}
}
