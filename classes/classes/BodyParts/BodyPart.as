/**
 * Created by aimozg on 25.04.2017.
 */
package classes.BodyParts {
import classes.CoC_Settings;
import classes.Creature;
import classes.internals.SimpleJsonable;

public class BodyPart extends SimpleJsonable {
	include "../../../includes/appearanceDefs.as";

	protected var _type:int = 0;
	public function restore(keepColor:Boolean = true):void {
		type = 0;
	}
	protected var creature:Creature;
	public function BodyPart(creature:Creature) {
		addPublicPrimitives("type");
		this.creature       = creature;
	}
	public function get type():int {return _type;}
	public function set type(value:int):void {_type = value;}
	override public function loadFromObject(o:Object, ignoreErrors:Boolean):void {
		restore(false);
		super.loadFromObject(o, ignoreErrors);
		// Upgrade old saves
		if (typeof o === 'object' && o != null && "type" in o && !("_type" in o)) this.type = o.type;
	}
	public function isAny(...args:Array):Boolean {
		for each (var i_type:int in args) if (type == i_type) return true;
		return false;
	}
	public function isNeither(...args:Array):Boolean {
		for each (var i_type:int in args) if (type == i_type) return false;
		return true;
	}
	/**
	 * Should be implemented in subclasses.
	 * @param options A part-dependent option set, for example {noAdj:true,noTone:true}
	 * Unless overriden by options, should return noun phrase
	 */
	public function describe(options:Object):String {
		CoC_Settings.errorAMC("BodyPart","describe");
		return "something";
	}
}
}
