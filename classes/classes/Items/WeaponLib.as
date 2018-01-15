/**
 * Created by aimozg on 09.01.14.
 */
package classes.Items
{
	import classes.Items.Weapons.*;
	import flash.sampler.NewObjectSample;

	public final class WeaponLib
	{
		public static const DEFAULT_VALUE:Number = 6;

		public static const FISTS:Fists = new Fists();
		
		//Regular Weapons
		public const BLUNDR0:Weapon = new Blunderbuss(0); //Tier 0
		public const BLUNDR1:Weapon = new Blunderbuss(1); //Tier 1
		public const BLUNDR2:Weapon = new Blunderbuss(2); //Tier 2
		
		public const CLAYMR0:Weapon = new LargeClaymore(0); //Tier 0
		public const CLAYMR1:Weapon = new LargeClaymore(1); //Tier 1
		public const CLAYMR2:Weapon = new LargeClaymore(2); //Tier 2
		
		public const CRSBOW0:Weapon = new Crossbow(0); //Tier 0
		public const CRSBOW1:Weapon = new Crossbow(1); //Tier 1
		public const CRSBOW2:Weapon = new Crossbow(2); //Tier 2
		
		public const DAGGER0:Weapon = new Dagger(0); //Tier 0
		public const DAGGER1:Weapon = new Dagger(1); //Tier 1
		public const DAGGER2:Weapon = new Dagger(2); //Tier 2
		
		public const FLAIL_0:Weapon = new Flail(0); //Tier 0
		public const FLAIL_1:Weapon = new Flail(1); //Tier 1
		public const FLAIL_2:Weapon = new Flail(2); //Tier 2
		
		public const FLNTLK0:Weapon = new FlintlockPistol(0); //Tier 0
		public const FLNTLK1:Weapon = new FlintlockPistol(1); //Tier 1
		public const FLNTLK2:Weapon = new FlintlockPistol(2); //Tier 2
		
		public const S_GAUNT:Weapon = new Weapon("S.Gaunt","S.Gauntlet","spiked gauntlet","a spiked gauntlet","spiked punch",5,400,"This single metal gauntlet has the knuckles tipped with metal spikes.  Though it lacks the damaging potential of other weapons, the sheer pain of its wounds has a chance of stunning your opponent."); //Tier 1
		public const H_GAUNT:Weapon = new Weapon("H.Gaunt", "H.Gaunt", "hooked gauntlets", "a set of hooked gauntlets", "clawing punch", 8, 300, "These metal gauntlets are covered in nasty looking hooks that are sure to tear at your foes flesh and cause them harm."); //Tier 2
		
		public const KATANA0:Weapon = new Katana(0); //Tier 0
		public const KATANA1:Weapon = new Katana(1); //Tier 1
		public const KATANA2:Weapon = new Katana(2); //Tier 2
		
		public const L__AXE0:Weapon = new LargeAxe(0); //Tier 0
		public const L__AXE1:Weapon = new LargeAxe(1); //Tier 1
		public const L__AXE2:Weapon = new LargeAxe(2); //Tier 2
		
		public const L_HAMR0:Weapon = new LargeHammer(0); //Tier 0
		public const L_HAMR1:Weapon = new LargeHammer(1); //Tier 1
		public const L_HAMR2:Weapon = new LargeHammer(2); //Tier 2
		
		public const MACE__0:Weapon = new Mace(0); //Tier 0
		public const MACE__1:Weapon = new Mace(1); //Tier 1
		public const MACE__2:Weapon = new Mace(2); //Tier 2
		
		public const RIDING0:Weapon = new RidingCrop(0); //Tier 0
		public const RIDING1:Weapon = new RidingCrop(1); //Tier 1
		public const RIDING2:Weapon = new RidingCrop(2); //Tier 2
		
		public const SCIMTR0:Weapon = new Scimitar(0); //Tier 0
		public const SCIMTR1:Weapon = new Scimitar(1); //Tier 1
		public const SCIMTR2:Weapon = new Scimitar(2); //Tier 2
		
		public const SPEAR_0:Weapon = new Spear(0); //Tier 0
		public const SPEAR_1:Weapon = new Spear(1); //Tier 1
		public const SPEAR_2:Weapon = new Spear(2); //Tier 2
		
		public const WARHAM0:Weapon = new HugeWarhammer(0); //Tier 0
		public const WARHAM1:Weapon = new HugeWarhammer(1); //Tier 1
		public const WARHAM2:Weapon = new HugeWarhammer(2); //Tier 2
		
		public const WHIP__0:Weapon = new Whip(0);
		public const WHIP__1:Weapon = new Whip(1);
		public const WHIP__2:Weapon = new Whip(2);
		
		//Special, Unique Weapons
		public const B_SWORD:Weapon = new BeautifulSword(); //Pure Weapon Tier 1
		public const PPSWORD:Weapon = new DivinePearlSword(); //Pure Weapon Tier 2
		
		public const B_SCARB:Weapon = new BrokenScarredBlade; //Corrupt Weapon Tier 0
		public const U_SWORD:Weapon = new UglySword(); //Corrupt Weapon Tier 1
		public const SCARBLD:Weapon = new ScarredBlade(); //Corrupt Weapon Tier 2		
		
		public const RRAPIER:RaphaelsRapier = new RaphaelsRapier(); //Rapier Tier 1
		public const JRAPIER:JeweledRapier = new JeweledRapier(); //Rapier Tier 2
		public const MRAPIER:MidnightRapier = new MidnightRapier(); //Rapier Tier 3
		
		public const S_BLADE:Spellblade = new Spellblade(); //Spellblade Tier 1
		public const RSBLADE:RunedSpellblade = new RunedSpellblade(); //Spellblade Tier 2
		
		public const W_STAFF:WizardsStaff = new WizardsStaff(); //Staff Tier 1
		public const E_STAFF:EldritchStaff = new EldritchStaff(); //Staff Tier 2
		public const L_STAFF:LethiciteStaff = new LethiciteStaff(); //Staff Tier 3
		
		//Currently not upgradable but they're special anyway.
		public const D_SPEAR:Weapon = new Weapon("D.Spear", "Drgn Spear", "dragoon spear", "a dragoon spear", "stab", 20, 2000, "A powerful-looking spear once wielded by the ancient dragons before the kobold invasion. You took this from the Kobold Broodmother in the arena.");
		public const HNTCANE:HuntsmansCane = new HuntsmansCane();
		public const L_DAGGR:Weapon = new Weapon("L.Daggr","L.Daggr","lust-enchanted dagger","an aphrodisiac-coated dagger","stab",3,150,"A dagger with a short blade in a wavy pattern.  Its edge seems to have been enchanted to always be covered in a light aphrodisiac to arouse anything cut with it.","Aphrodisiac Weapon");
		public const L_WHIP :Weapon = new LethicesWhip(); //Whip Tier 2
		public const KIHAAXE:Weapon = new KihasAxe();
		public const SUCWHIP:Weapon = new Weapon("SucWhip","SucWhip","succubi whip","a succubi whip","sexy whipping",10,400,"This coiled length of midnight-black leather practically exudes lust. Though it looks like it could do a lot of damage, the feel of that slick leather impacting flesh is sure to inspire lust. However, it might slowly warp the mind of wielder."); //Whip Tier 1, bring masterwork whip for this one.
		public const URTAHLB:Weapon = new Weapon("UrtaHlb", "UrtaHlb", "halberd", "a halberd", "slash", 11, 10, "Urta's halberd. How did you manage to get this?", "Large");
		
		//Unsorted Weapons
		public const PIPE   :Weapon = new Weapon("Pipe   ","Pipe","pipe","a pipe","smash",5,25,"This is a simple rusted pipe of unknown origins.  It's hefty and could probably be used as an effective bludgeoning tool.");
		public const PTCHFRK:Weapon = new Weapon("PtchFrk","Pitchfork","pitchfork","a pitchfork","stab",10,200,"This is a pitchfork.  Intended for farm work but also useful as stabbing weapon.");
		
		public function WeaponLib() {}
	}
}
