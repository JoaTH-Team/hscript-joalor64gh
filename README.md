# HScript Joalor64GH
A hscript from Joalor64GH code

## Example
- Call function
```haxe
// executeMe.txt
function new() {
    trace("hello number " + num); // should return `hello number 12345`
}

// Main.hx
import joalor64gh.HScript;

class Main {
    var hscript:HScript;
    
    public static function new() {
        super();

        hscript = new HScript("executeMe.txt", true); // Will execute a exists file
        hscript.set('num', 12345);
        hscript.call('new', []);
    }
}
```