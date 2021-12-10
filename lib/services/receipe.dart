import 'dart:convert';
import 'dart:html';
import '../models/hits.dart';
import 'package:http/http.dart' as http;

class Recipie {
  List<Hits> hits = [];

  Future<void> getReceipe() async {
    var url = Uri.parse(
        "https://api.edamam.com/search?q=banana&app_id=0f21d949&app_key=c8daa8a855225d925157f8c7e093a014");
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element) {
      Hits hits = Hits(
        recipeModel: element['recipe'],
      );
      // hits.recipeModel = add(Hits.fromMap(hits.recipeModel));
    });
  }
}

class UploadImageGetResponse {
  static upload(File file) {}
}
