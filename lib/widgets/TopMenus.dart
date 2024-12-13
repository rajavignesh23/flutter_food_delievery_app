import 'package:flutter/material.dart';

class TopMenus extends StatefulWidget {
  const TopMenus({super.key});

  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          TopMenuTiles(name: "Burger", imageUrl: "ic_burger", slug: "burger"),
          TopMenuTiles(name: "Sushi", imageUrl: "ic_sushi", slug: "sushi"),
          TopMenuTiles(name: "Pizza", imageUrl: "ic_pizza", slug: "pizza"),
          TopMenuTiles(name: "Cake", imageUrl: "ic_cake", slug: "cake"),
          TopMenuTiles(name: "Ice Cream", imageUrl: "ic_ice_cream", slug: "ice_cream"),
          TopMenuTiles(name: "Soft Drink", imageUrl: "ic_soft_drink", slug: "soft_drink"),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String slug;

  const TopMenuTiles({
    super.key, 
    required this.name,
    required this.imageUrl,
    required this.slug,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VarietyPage(category: name),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 25.0,
                offset: Offset(0.0, 0.75),
              ),
            ]),
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(3.0),
                ),
              ),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Image.asset(
                    'assets/images/topmenu/$imageUrl.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          Text(name,
              style: const TextStyle(
                  color: Color(0xFF6e6e71),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

// A new page to show varieties
class VarietyPage extends StatelessWidget {
  final String category;

  const VarietyPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Sample varieties for each category
    final Map<String, List<String>> varieties = {
      "Burger": ["Cheese Burger", "Chicken Burger", "Vegan Burger"],
      "Sushi": ["Salmon Sushi", "Tuna Sushi", "Vegetable Sushi"],
      "Pizza": ["Margherita", "Pepperoni", "BBQ Chicken"],
      "Cake": ["Chocolate Cake", "Vanilla Cake", "Red Velvet"],
      "Ice Cream": ["Vanilla", "Strawberry", "Chocolate"],
      "Soft Drink": ["Cola", "Lemonade", "Orange Soda"],
    };

    return Scaffold(
      appBar: AppBar(title: Text("$category Varieties")),
      body: ListView.builder(
        itemCount: varieties[category]?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(varieties[category]![index]),
          );
        },
      ),
    );
  }
}
