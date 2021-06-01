package python.numpy;

@:pythonImport("numpy") extern class Numpy_Module {
	static public var ALLOW_THREADS: Dynamic;

	static public function mean(values: Array<Float>): Float;
}
