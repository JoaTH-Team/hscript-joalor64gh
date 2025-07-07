package joalor64gh;

import hscript.*;
import joalor64gh.macros.Macros;

class HScript {
    public var interp:Interp = new Interp();
    public var parser:Parser = new Parser();

    public function new(?file:String, ?execute:Bool = true) {
        // super();

        parser.preprocesorValues = Macros.getDefines();
        
    }
}