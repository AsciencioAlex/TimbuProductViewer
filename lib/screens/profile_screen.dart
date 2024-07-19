import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Replace with user's profile image URL
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alex Ascencio', // Replace with user's name
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'alex@example.com', // Replace with user's email
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Account Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Name'),
                subtitle: Text('Alex Ascencio'), // Replace with user's name
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('alex@example.com'), // Replace with user's email
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone Number'),
                subtitle:
                    Text('+123 456 7890'), // Replace with user's phone number
              ),
              SizedBox(height: 20),
              Text(
                'Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                onTap: () {
                  // Navigate to Change Password Screen
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
