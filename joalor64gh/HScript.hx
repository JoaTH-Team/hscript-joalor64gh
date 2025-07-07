package joalor64gh;

import hscript.*;
import joalor64gh.macros.Macros;
import sys.io.File;

class HScript {
    public var interp:Interp = new Interp();
    public var parser:Parser = new Parser();

    public function new(?file:String, ?execute:Bool = false) {
        parser.preprocesorValues = Macros.getDefines();

		if (execute && file != null)
			executeFile(file);
    }

	public function executeFile(file:String):Void {
		try {
			interp.execute(parser.parseString(File.getContent(file)));
		} catch (e:Dynamic)
            returnError(e);
	}

    public function executeString(str:String):Void {
		try {
			@:privateAccess parser.line = 1;
			return interp.execute(parser.parseString(str));
		} catch (e:Dynamic)
            returnError(e);
	}

	public function set(name:String, val:Dynamic):Void {
		try {
			interp?.variables.set(name, val);
		} catch (e:Dynamic)
			returnError(e);
	}

	public function get(name:String):Void {
		try {
			interp?.variables.get(name);
		} catch (e:Dynamic)
			returnError(e);
	}

	public function remove(name:String):Void {
		try {
			interp?.variables.remove(name);
		} catch (e:Dynamic)
			returnError(e);
	}

    public function exists(name:String):Bool {
		try {
			return interp?.variables.exists(name);
		} catch (e:Dynamic)
			returnError(e);
	}

	public function call(funcName:String, ?args:Array<Dynamic>):Dynamic {
		if (exists(funcName)) {
			try {
				return Reflect.callMethod(this, get(funcName), args == null ? [] : args);
			} catch (e:Dynamic)
				returnError(e);
		}
		return null;
	}

    public function returnError(e:Dynamic):Dynamic {
        throw 'HScript error: ${Std.string(e)}';
    }
}