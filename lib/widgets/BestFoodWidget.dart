import 'package:flutter/material.dart';

class BestFoodWidget extends StatefulWidget {
  const BestFoodWidget({super.key});

  @override
  _BestFoodWidgetState createState() => _BestFoodWidgetState();
}

class _BestFoodWidgetState extends State<BestFoodWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          BestFoodTitle(),
          Expanded(
            child: BestFoodList(),
          )
        ],
      ),
    );
  }
}

class BestFoodTitle extends StatelessWidget {
  const BestFoodTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Best Foods",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF3a3a3b),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class BestFoodTiles extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String rating;
  final String numberOfRating;
  final String price;
  final String slug;

  BestFoodTiles({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.numberOfRating,
    required this.price,
    required this.slug,
    Key? key, // Use Key? for optional key
  }) : super(key: key!); // Use key! to assert that key is not null

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle the tile tap
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: const BoxDecoration(boxShadow: [
              /* BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ), */
            ]),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              margin: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/images/bestfood/' + imageUrl + ".jpeg",
                fit: BoxFit.cover, // Ensures the image covers the card
              ),
            ),
          ),
          const SizedBox(height: 5), // Optional spacing between the image and additional info
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "$price \$", // Add dollar sign for price
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Text(
                rating,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.orange, // Color for rating
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "($numberOfRating ratings)",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BestFoodList extends StatelessWidget {
  const BestFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BestFoodTiles(
          name: "Fried Egg",
          imageUrl: "ic_best_food_8",
          rating: '4.9',
          numberOfRating: '200',
          price: '15.06',
          slug: "fried_egg",
          key: const Key('fried_egg'), // Added a unique key
        ),
        BestFoodTiles(
          name: "Mixed Vegetable",
          imageUrl: "ic_best_food_9",
          rating: "4.9",
          numberOfRating: "100",
          price: "17.03",
          slug: "",
          key: const Key('mixed_vegetable'), // Added a unique key
        ),
        BestFoodTiles(
          name: "Salad with Chicken Meat",
          imageUrl: "ic_best_food_10",
          rating: "4.0",
          numberOfRating: "50",
          price: "11.00",
          slug: "",
          key: const Key('salad_with_chicken_meat'), // Added a unique key
        ),
        BestFoodTiles(
          name: "New Mixed Salad",
          imageUrl: "ic_best_food_5",
          rating: "4.00",
          numberOfRating: "100",
          price: "11.10",
          slug: "",
          key: const Key('new_mixed_salad'), // Added a unique key
        ),
        BestFoodTiles(
          name: "Red Meat with Salad",
          imageUrl: "ic_best_food_1",
          rating: "4.6",
          numberOfRating: "150",
          price: "12.00",
          slug: "",
          key: const Key('red_meat_with_salad'), // Added a unique key
        ),
        BestFoodTiles(
          name: "New Mixed Salad",
          imageUrl: "ic_best_food_2",
          rating: "4.00",
          numberOfRating: "100",
          price: "11.10",
          slug: "",
          key: const Key('new_mixed_salad_2'), // Added a unique key
        ),
        BestFoodTiles(
          name: "Potato with Meat Fry",
          imageUrl: "ic_best_food_3",
          rating: "4.2",
          numberOfRating: "70",
          price: "23.0",
          slug: "",
          key: const Key('potato_with_meat_fry'), // Added a unique key
        ),
        BestFoodTiles(
          name: "Fried Egg",
          imageUrl: "ic_best_food_4",
          rating: '4.9',
          numberOfRating: '200',
          price: '15.06',
          slug: "fried_egg",
          key: const Key('fried_egg_2'), // Added a unique key
        ),
        BestFoodTiles(
          name: "Red Meat with Salad",
          imageUrl: "ic_best_food_5",
          rating: "4.6",
          numberOfRating: "150",
          price: "12.00",
          slug: "",
          key: const Key('red_meat_with_salad_2'), // Added a unique key
        ),
        BestFoodTiles(
          name: "Red Meat with Salad",
          imageUrl: "ic_best_food_6",
          rating: "4.6",
          numberOfRating: "150",
          price: "12.00",
          slug: "",
          key: const Key('red_meat_with_salad_3'), // Added a unique key
        ),
        BestFoodTiles(
          name: "Red Meat with Salad",
          imageUrl: "ic_best_food_7",
          rating: "4.6",
          numberOfRating: "150",
          price: "12.00",
          slug: "",
          key: const Key('red_meat_with_salad_4'), // Added a unique key
        ),
      ],
    );
  }
}
