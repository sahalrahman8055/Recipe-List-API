import 'dart:convert';
import 'package:flavorfusion/model/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<RecipeModel>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", 'tag': 'list.recipe.popular'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '2728ba7e82mshf9d4711452c78c4p10e867jsn8616d40ba7cd',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }
    return RecipeModel.recipesFromSnapshot(temp);
  }
}
