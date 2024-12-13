import 'package:flutter/material.dart';
import 'package:flutter_food/widgets/BottomNavBarWidget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          // Cart Items Section
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: 3, // Replace with the actual cart item count
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 2,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://via.placeholder.com/80', // Replace with actual food item image
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: const Text('Food Item Name'), // Replace with actual food item name
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Description or Restaurant Name', style: TextStyle(fontSize: 12)),
                        SizedBox(height: 5),
                        Text('\$12.99', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)), // Replace with actual price
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Decrease quantity logic
                          },
                          icon: const Icon(Icons.remove_circle, color: Colors.redAccent),
                        ),
                        const Text('1'), // Replace with actual quantity
                        IconButton(
                          onPressed: () {
                            // Increase quantity logic
                          },
                          icon: const Icon(Icons.add_circle, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ),
          // Price Summary Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Subtotal:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('\$38.97', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Replace with actual subtotal
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Delivery Fee:', style: TextStyle(fontSize: 16)),
                    Text('\$2.99', style: TextStyle(fontSize: 16)), // Replace with actual delivery fee
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      '\$41.96',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
                    ), // Replace with actual total
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    _showConfirmationModal(context); // Show confirmation modal
                  },
                  child: const Center(
                    child: Text('Proceed to Checkout', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  // Confirmation Modal Bottom Sheet
  void _showConfirmationModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Order Confirmation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Order Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Subtotal: \$38.97', style: TextStyle(fontSize: 16)),
              const Text('Delivery Fee: \$2.99', style: TextStyle(fontSize: 16)),
              const Text('Total: \$41.96', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pop(context); // Close modal
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order placed successfully!')),
                  );
                },
                child: const Center(
                  child: Text('Confirm Order', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close modal
                },
                child: const Center(
                  child: Text('Cancel', style: TextStyle(fontSize: 16, color: Colors.redAccent)),
                ),
              ),
            ],
          ),
        );
},
);
}
}
