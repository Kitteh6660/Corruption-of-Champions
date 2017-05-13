package classes.Perks
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.StatusEffects;

	public class CleansingPalmPerk extends PerkType
	{

		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			if (player.cor >= (10 + player.corruptionTolerance())) return "<b>DISABLED</b> - Corruption too high!";
			else return super.desc(params);
		}

		public function CleansingPalmPerk()
		{
			super("Cleansing Palm", "Cleansing Palm", "A ranged fighting technique of Jojo’s order, allows you to blast your enemies with waves of pure spiritual energy, weakening them and hurting the corrupt.");
		}
	}
}
