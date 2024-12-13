import 'package:flutter/material.dart';
import 'package:flutter_food/widgets/BottomNavBarWidget.dart';

class NearByPage extends StatelessWidget {
  const NearByPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of restaurants
    final List<Map<String, String>> restaurants = [
      {
        'name': 'Pasta Palace',
        'image': 'assets/restaurant1.jpeg',
        'rating': '4.5',
        'address': '123 Foodie St, New York, NY',
      },
      {
        'name': 'Burger Haven',
        'image': 'assets/restaurant2.jpeg',
        'rating': '4.3',
        'address': '456 Burger Ave, Los Angeles, CA',
      },
      {
        'name': 'Sushi Corner',
        'image': 'assets/restaurant3.jpeg',
        'rating': '4.8',
        'address': '789 Sushi Rd, San Francisco, CA',
      },
      {
        'name': 'BBQ Grillhouse',
        'image': 'assets/hotel.jpeg',
        'rating': '4.2',
        'address': '101 BBQ Lane, Austin, TX',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Restaurants'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return GestureDetector(
            onTap: () {
              _showRestaurantBottomSheet(context, restaurant);
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    restaurant['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  restaurant['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Text(restaurant['rating']!),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      restaurant['address']!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  // Show Bottom Sheet with Restaurant Details
  void _showRestaurantBottomSheet(BuildContext context, Map<String, String> restaurant) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return RestaurantDetailPage(
          restaurantName: restaurant['name']!,
          restaurantImage: restaurant['image']!,
          restaurantRating: restaurant['rating']!,
          restaurantAddress: restaurant['address']!,
        );
      },
    );
  }
}

// A placeholder for RestaurantDetailPage
class RestaurantDetailPage extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final String restaurantRating;
  final String restaurantAddress;

  const RestaurantDetailPage({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.restaurantRating,
    required this.restaurantAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurantName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange),
              Text(restaurantRating),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              restaurantImage,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            restaurantAddress,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {
              // Navigate to order page or menu
            },
            child: const Center(
              child: Text(
                'Order Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
