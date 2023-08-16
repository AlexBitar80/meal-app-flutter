import 'package:flutter/material.dart';

import '../../models/meals.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({
    super.key,
  });

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      width: 300,
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            expandedHeight: 240,
            stretchTriggerOffset: 150.0,
            toolbarHeight: kToolbarHeight,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                meal.title,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
              ),
              expandedTitleScale: 1.8,
              collapseMode: CollapseMode.parallax,
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    _createSectionTitle(context, 'Ingredientes'),
                    _createSectionContainer(
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        itemCount: meal.ingredients.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Theme.of(context).colorScheme.secondary,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              child: Text(meal.ingredients[index]),
                            ),
                          );
                        },
                      ),
                    ),
                    _createSectionTitle(context, 'Passos'),
                    _createSectionContainer(
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        itemCount: meal.steps.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text(
                                    '${index + 1}',
                                  ),
                                ),
                                title: Text(meal.steps[index]),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
