package io;

class Csv {
	public static function parse(fileName: String): Array<Map<String, String>> {
		final fileInput = sys.io.File.read(fileName, false);

		final headers = fileInput.readLine().split(",");

		final features: Array<Map<String, String>> = [
			while(!fileInput.eof()) Lambda.foldi([
				for (field in fileInput.readLine().split(",")) field
			], function(field: String, fields: Map<String, String>, i) {
				fields.set(headers[i], ~/^"(.*)"$/.replace(field, "$1"));

				return fields;
			}, [])
		];

		fileInput.close();

		return features;
	}
}
