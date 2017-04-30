/**
 * Created by aimozg on 25.04.2017.
 */
package classes.internals {
import mx.logging.ILogger;

public class SimpleJsonable implements Jsonable{
	private static const LOGGER:ILogger = LoggerFactory.getLogger(SimpleJsonable);
	protected const myPublicPrimitives: Array = [];
	protected const myPublicJsonables: Array = [];
	/**
	 * @see Utils.copyObject
	 * Short version: names of !public! !primitive!-typed properties that should be saved/loaded
	 */
	protected function addPublicPrimitives(...args:Array): void {
		myPublicPrimitives.push.apply(myPublicPrimitives,args);
	}
	/**
	 * @return name of !public! !Jsonable!-typed property that should be saved/loaded
	 */
	protected function addPublicJsonable(arg:String):void {
		myPublicJsonables.push(arg);
	}
	public function saveToObject():Object {
		var o:* = {};
		if (myPublicPrimitives.length > 0) o = Utils.copyObjectEx(o, this, myPublicPrimitives, true);
		for each (var key:String in myPublicJsonables) {
			o[key] = (this[key] as Jsonable).saveToObject();
		}
		return o;
	}
	public function loadFromObject(o:Object, ignoreErrors:Boolean):void {
		if (!(o is Object) || o === null) o = {};
		if (myPublicPrimitives.length>0) Utils.copyObjectEx(this, o, myPublicPrimitives, false, ignoreErrors);
		for each (var key:String in myPublicJsonables) {
			var v:* = o[key];
			if (!(v is Object) || v === null) v = {};
			try {
				(this[key] as Jsonable).loadFromObject(v, ignoreErrors);
			} catch (e:*) {
				if (!ignoreErrors) throw e;
				LOGGER.info(e);
			}
		}
	}
}
}
