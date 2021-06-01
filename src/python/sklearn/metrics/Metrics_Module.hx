package python.sklearn.metrics;

@:pythonImport("sklearn", "metrics")
extern class Metrics_Module {
	public static function mean_squared_error(
		yTrue: Array<Float>,
		yPred: Array<Float>
	): Float;
}
