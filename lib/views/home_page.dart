import 'package:flavorfusion/controller/recipe_provider.dart';
import 'package:flavorfusion/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<RecipeProvider>(context, listen: false).getFoodRecipe();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant),
              SizedBox(
                width: 20,
              ),
              Text("Flavor Fusion"),
            ],
          ),
        ),
        body: Consumer<RecipeProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }else{
               return ListView.builder(
              itemCount: provider.recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                    title: provider.recipes[index].name,
                    cookTime: provider.recipes[index].totalTime,
                    rating: provider.recipes[index].rating.toString(),
                    thumbnailUrl: provider.recipes[index].images);
              },
            );
            }
           
          },
        ));
  }
}
