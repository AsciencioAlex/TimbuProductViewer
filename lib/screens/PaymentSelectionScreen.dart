import 'package:flutter/material.dart';
import 'PaymentSuccessScreen.dart';

class PaymentSelectionScreen extends StatefulWidget {
  static const routeName = '/payment-selection';

<<<<<<< HEAD
  const PaymentSelectionScreen({super.key});

=======
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
  @override
  _PaymentSelectionScreenState createState() => _PaymentSelectionScreenState();
}

class _PaymentSelectionScreenState extends State<PaymentSelectionScreen> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = '';
  String _email = '';
  String _phoneNumber = '';

  void _proceedToPayment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushNamed(context, PaymentSuccessScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
=======
        title: Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
            const Text('Order list',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // Add order list summary here
            const SizedBox(height: 20),
            const Text('Select a payment option',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Card(
              child: ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.red),
                title: const Text('**** **** **** 1234'),
                subtitle: const Text('05/24'),
=======
            Text('Order list',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // Add order list summary here
            SizedBox(height: 20),
            Text('Select a payment option',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Card(
              child: ListTile(
                leading: Icon(Icons.credit_card, color: Colors.red),
                title: Text('**** **** **** 1234'),
                subtitle: Text('05/24'),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                trailing: Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (bool? value) {},
                ),
              ),
            ),
<<<<<<< HEAD
            const SizedBox(height: 10),
=======
            SizedBox(height: 10),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
            TextButton(
              onPressed: () {
                // Add new card functionality
              },
<<<<<<< HEAD
              child: const Text('Add a new Card',
                  style: TextStyle(color: Colors.blue)),
=======
              child:
                  Text('Add a new Card', style: TextStyle(color: Colors.blue)),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
<<<<<<< HEAD
                    decoration: const InputDecoration(labelText: 'Full name'),
=======
                    decoration: InputDecoration(labelText: 'Full name'),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _fullName = value!;
                    },
                  ),
                  TextFormField(
<<<<<<< HEAD
                    decoration:
                        const InputDecoration(labelText: 'Email address'),
=======
                    decoration: InputDecoration(labelText: 'Email address'),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
<<<<<<< HEAD
                    decoration:
                        const InputDecoration(labelText: 'Phone number'),
=======
                    decoration: InputDecoration(labelText: 'Phone number'),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phoneNumber = value!;
                    },
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _proceedToPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize:
                          const Size(double.infinity, 50), // Adjust button size
                    ),
                    child: const Text('Proceed to payment'),
=======
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _proceedToPayment,
                    child: Text('Proceed to payment'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize:
                          Size(double.infinity, 50), // Adjust button size
                    ),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
