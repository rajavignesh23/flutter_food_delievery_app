import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_food/widgets/BottomNavBarWidget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String userName = "Your name";
  String userPhone = "+1 234 567 890";
  String userEmail = "xyz@gmail.com";
  File? profileImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  void editProfile(BuildContext context) {
    final nameController = TextEditingController(text: userName);
    final phoneController = TextEditingController(text: userPhone);
    final emailController = TextEditingController(text: userEmail);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              left: 20, right: 20, top: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userName = nameController.text;
                    userPhone = phoneController.text;
                    userEmail = emailController.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: profileImage != null
                          ? FileImage(profileImage!)
                          : const AssetImage('assets/bg.jpg') as ImageProvider,
                      child: profileImage == null
                          ? const Icon(Icons.camera_alt, size: 30, color: Colors.white)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(userPhone,
                            style: const TextStyle(fontSize: 16, color: Colors.white70)),
                        const SizedBox(height: 5),
                        Text(userEmail,
                            style: const TextStyle(fontSize: 16, color: Colors.white70)),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                          onPressed: () => editProfile(context),
                          child: const Text("Edit Profile",
                              style: TextStyle(color: Colors.redAccent)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Profile Options
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.redAccent),
              title: const Text('My Addresses'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddressPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.redAccent),
              title: const Text('My Orders'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OrdersPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment, color: Colors.redAccent),
              title: const Text('Payment Methods'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PaymentMethodsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.redAccent),
              title: const Text('Favourites'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FavouritesPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.redAccent),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NotificationsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.redAccent),
              title: const Text('Help & Support'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HelpSupportPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.redAccent),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUsPage()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}

// Mock Pages Implementation
class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Addresses')),
      body: const Center(child: Text('Address Management Page')),
    );
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: const Center(child: Text('Orders Management Page')),
    );
  }
}

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Methods')),
      body: const Center(child: Text('Payment Methods Page')),
    );
  }
}

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Favourites')),
      body: const Center(child: Text('Favourites Page')),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(child: Text('Notifications Page')),
    );
  }
}

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: const Center(child: Text('Help & Support Page')),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: const Center(child: Text('About Us Page')),
);
}
}
