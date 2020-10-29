class Similaridade {
	String inputPath;
	List<Result> result;

	Similaridade({this.inputPath, this.result});

	Similaridade.fromJson(Map<String, dynamic> json) {
    print('json: $json');
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

// class Landmarks {
// 	List<List> bottomLip;
// 	List<List> chin;
// 	List<List> leftEye;
// 	List<List> leftEyebrow;
// 	List<List> noseBridge;
// 	List<List> noseTip;
// 	List<List> rightEye;
// 	List<List> rightEyebrow;
// 	List<List> topLip;

// 	Landmarks({this.bottomLip, this.chin, this.leftEye, this.leftEyebrow, this.noseBridge, this.noseTip, this.rightEye, this.rightEyebrow, this.topLip});

// 	Landmarks.fromJson(Map<String, dynamic> json) {
// 		if (json['bottom_lip'] != null) {
// 			bottomLip = new List<List>();
// 			json['bottom_lip'].forEach((v) { bottomLip.add(new List.fromJson(v)); });
// 		}
// 		if (json['chin'] != null) {
// 			chin = new List<List>();
// 			json['chin'].forEach((v) { chin.add(new List.fromJson(v)); });
// 		}
// 		if (json['left_eye'] != null) {
// 			leftEye = new List<List>();
// 			json['left_eye'].forEach((v) { leftEye.add(new List.fromJson(v)); });
// 		}
// 		if (json['left_eyebrow'] != null) {
// 			leftEyebrow = new List<List>();
// 			json['left_eyebrow'].forEach((v) { leftEyebrow.add(new List.fromJson(v)); });
// 		}
// 		if (json['nose_bridge'] != null) {
// 			noseBridge = new List<List>();
// 			json['nose_bridge'].forEach((v) { noseBridge.add(new List.fromJson(v)); });
// 		}
// 		if (json['nose_tip'] != null) {
// 			noseTip = new List<List>();
// 			json['nose_tip'].forEach((v) { noseTip.add(new List.fromJson(v)); });
// 		}
// 		if (json['right_eye'] != null) {
// 			rightEye = new List<List>();
// 			json['right_eye'].forEach((v) { rightEye.add(new List.fromJson(v)); });
// 		}
// 		if (json['right_eyebrow'] != null) {
// 			rightEyebrow = new List<List>();
// 			json['right_eyebrow'].forEach((v) { rightEyebrow.add(new List.fromJson(v)); });
// 		}
// 		if (json['top_lip'] != null) {
// 			topLip = new List<List>();
// 			json['top_lip'].forEach((v) { topLip.add(new List.fromJson(v)); });
// 		}
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.bottomLip != null) {
//       data['bottom_lip'] = this.bottomLip.map((v) => v.toJson()).toList();
//     }
// 		if (this.chin != null) {
//       data['chin'] = this.chin.map((v) => v.toJson()).toList();
//     }
// 		if (this.leftEye != null) {
//       data['left_eye'] = this.leftEye.map((v) => v.toJson()).toList();
//     }
// 		if (this.leftEyebrow != null) {
//       data['left_eyebrow'] = this.leftEyebrow.map((v) => v.toJson()).toList();
//     }
// 		if (this.noseBridge != null) {
//       data['nose_bridge'] = this.noseBridge.map((v) => v.toJson()).toList();
//     }
// 		if (this.noseTip != null) {
//       data['nose_tip'] = this.noseTip.map((v) => v.toJson()).toList();
//     }
// 		if (this.rightEye != null) {
//       data['right_eye'] = this.rightEye.map((v) => v.toJson()).toList();
//     }
// 		if (this.rightEyebrow != null) {
//       data['right_eyebrow'] = this.rightEyebrow.map((v) => v.toJson()).toList();
//     }
// 		if (this.topLip != null) {
//       data['top_lip'] = this.topLip.map((v) => v.toJson()).toList();
//     }
// 		return data;
// 	}
// }

// class BottomLip {


// 	BottomLip({});

// 	BottomLip.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
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