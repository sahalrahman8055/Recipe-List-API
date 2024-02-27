import 'package:flavorfusion/model/recipe_model.dart';
import 'package:flavorfusion/service/get_recipe.dart';
import 'package:flutter/material.dart';

class RecipeProvider extends ChangeNotifier {
  List<RecipeModel> recipes = [];
  bool isLoading = true;

  Future getFoodRecipe() async {
    recipes = await GetRecipe().getRecipe();
    isLoading = false;
    notifyListeners();
  }
}
