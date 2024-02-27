import 'package:flavorfusion/model/recipe_model.dart';
import 'package:flavorfusion/service/recipe_services.dart';

class GetRecipe {
  List<RecipeModel> recipes = [];

  Future getRecipe() async {
    recipes = await RecipeApi.getRecipe();

    return recipes;
  }
}
