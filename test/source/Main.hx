import joalor64gh.HScript;

class Main {
    static var script:HScript;
    
    static function main() {
        script = new HScript("test/executeMe.txt", true);
        script.set("cool", 12345);
        script.call("onRun", []);
    }
}