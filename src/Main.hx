import python.sklearn.model_selection.ModelSelection;
import haxe.io.Path;
import io.Csv;

class Main {
	static function main() {
		trace("Reading data...");

		final features = Csv.parse(Path.normalize("data/kc_house_data.csv"));

		trace("Reading data done");
		trace("Parsing data...");

		final prices: Array<Float> = [];
		final featuresAnalysis: Array<Array<Float>> = [];

		for (feature in features) {
			prices.push(Std.parseFloat(feature.get("price")));

			// sqft_living, sqft_living15, sqft_above, yr_renovated, yr_built,
			// bedrooms, bathrooms, floors, grade, condition
			featuresAnalysis.push([
				1.0,
				Std.parseFloat(feature.get("sqft_living")),
				Std.parseFloat(feature.get("sqft_living15")),
				Std.parseFloat(feature.get("sqft_above")),
				Std.parseFloat(feature.get("yr_renovated")) == 0.0 ? 0.0 : 1.0,
				Std.parseFloat(feature.get("yr_built")),
				Std.parseFloat(feature.get("bedrooms")),
				Std.parseFloat(feature.get("bathrooms")),
				Std.parseFloat(~/\[\]/g.replace(feature.get("floors"), "")),
				Std.parseFloat(feature.get("grade")),
				Std.parseFloat(feature.get("condition"))
			]);
		}

		trace("Parsing data done");

		final trainSet = ModelSelection.train_test_split(featuresAnalysis, prices, {
			test_size: 0.33,
			random_state: 23
		});

		final xTrain = trainSet._1;
		final xValid = trainSet._2;
		final yTrain = trainSet._3;
		final yValid = trainSet._4;

		final testSet = ModelSelection.train_test_split(xValid, yValid, {
			test_size: 0.50,
			random_state: 23
		});

		final xTest = testSet._2;
		final yTest = testSet._4;

		// RMSE of using average house price as constant predictor
	}
}
