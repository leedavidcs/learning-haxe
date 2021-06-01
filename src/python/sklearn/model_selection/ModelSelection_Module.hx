package python.sklearn.model_selection;

import python.Tuple.Tuple4;

@:pythonImport("sklearn", "model_selection")
extern class ModelSelection_Module {
	public static function train_test_split(
		xs: Array<Array<Dynamic>>,
		ys: Array<Dynamic>,
		kwargs: KwArgs<{
			?test_size: Float,
			?train_size: Int,
			?random_state: Int,
			?shuffle: Bool,
			?stratify: Array<Dynamic>
		}>
	): Tuple4<
		Array<Array<Float>>,
		Array<Array<Float>>,
		Array<Float>,
		Array<Float>
	>;
}
