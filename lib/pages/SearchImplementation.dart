import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{

  final keywords = [
    "irrigation",
    "cultivation",
    "husbandry",
    "horticulture",
    "crop",
    "biofuel",
    "farm",
    "animal husbandry",
    "farming",
    "cultivate",
    "agribusiness",
    "food",
    "domestication",
    "agricultural",
    "manure",
    "tillage",
    "monoculture",
    "forestry",
    "livestock",
    "harvest",
    "agronomy",
    "pesticide",
    "wool",
    "neolithic revolution",
    "cotton",
    "wheat",
    "crop rotation",
    "dairy",
    "aquaculture",
    "sow",
    "hydroponics",
    "education",
  ];
  List<String> recentWord = [
    "wool",
    "neolithic revolution",
    "cotton",
    "wheat",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){},
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? recentWord:keywords;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text(suggestions[index]),
      ),
      itemCount: suggestions.length,

    );
  }
  
}