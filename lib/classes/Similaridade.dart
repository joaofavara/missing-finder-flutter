class Similaridade {
	String inputPath;
	List<Result> result;

	Similaridade({this.inputPath, this.result});

	Similaridade.fromJson(Map<String, dynamic> json) {
		inputPath = json['input_path'];
		if (json['result'] != null) {
			result = new List<Result>();
			json['result'].forEach((v) { result.add(new Result.fromJson(v)); });
		}
	}

	// Map<String, dynamic> toJson() {
	// 	final Map<String, dynamic> data = new Map<String, dynamic>();
	// 	data['input_path'] = this.inputPath;
	// 	if (this.result != null) {
  //     data['result'] = this.result.map((v) => v.toJson()).toList();
  //   }
	// 	return data;
	// }
}

class Result {
	// List<double> encoding;
	// int faceId;
	// bool isKnown;
	// Landmarks landmarks;
	// List<int> locations;
	// String origin;
	List<Recommendations> recommendations;

	// Result({this.encoding, this.faceId, this.isKnown, this.landmarks, this.locations, this.origin, this.recommendations});
	Result({this.recommendations});

	Result.fromJson(Map<String, dynamic> json) {
		// encoding = json['encoding'].cast<double>();
		// faceId = json['faceId'];
		// isKnown = json['isKnown'];
		// landmarks = json['landmarks'] != null ? new Landmarks.fromJson(json['landmarks']) : null;
		// locations = json['locations'].cast<int>();
		// origin = json['origin'];
		if (json['recommendations'] != null) {
			recommendations = new List<Recommendations>();
			json['recommendations'].forEach((v) { recommendations.add(new Recommendations.fromJson(v)); });
		}
	}
}
// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['encoding'] = this.encoding;
// 		data['faceId'] = this.faceId;
// 		data['isKnown'] = this.isKnown;
// 		if (this.landmarks != null) {
//       data['landmarks'] = this.landmarks.toJson();
//     }
// 		data['locations'] = this.locations;
// 		data['origin'] = this.origin;
// 		if (this.recommendations != null) {
//       data['recommendations'] = this.recommendations.map((v) => v.toJson()).toList();
//     }
// 		return data;
// 	}
// }



class Recommendations {
	int age;
	List<double> encoding;
	int id;
	String image;
	String name;
	String output;
	String similarity;
	String type;

	Recommendations({this.age, this.encoding, this.id, this.image, this.name, this.output, this.similarity, this.type});

	Recommendations.fromJson(Map<String, dynamic> json) {
		age = json['age'];
		encoding = json['encoding'].cast<double>();
		id = json['id'];
		image = json['image'];
		name = json['name'];
		output = json['output'];
		similarity = json['similarity'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['age'] = this.age;
		data['encoding'] = this.encoding;
		data['id'] = this.id;
		data['image'] = this.image;
		data['name'] = this.name;
		data['output'] = this.output;
		data['similarity'] = this.similarity;
		data['type'] = this.type;
		return data;
	}
}