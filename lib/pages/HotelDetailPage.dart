import 'package:flutter/material.dart';

class HotelDetailPage extends StatelessWidget {
  final String hotelName;
  final String hotelImage;
  final String hotelRating;

  const HotelDetailPage({
    super.key,
    required this.hotelName,
    required this.hotelImage,
    required this.hotelRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotelName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              hotelImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orange,
                size: 20,
              ),
              Text(
                hotelRating,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Hotel Description: \n\nA luxury hotel with a panoramic view of the city and excellent services.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // You can add booking functionality or navigate to a booking page.
              Navigator.pop(context);
            },
            child: const Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
