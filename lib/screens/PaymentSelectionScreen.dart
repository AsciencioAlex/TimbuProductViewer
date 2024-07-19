import 'package:flutter/material.dart';
import 'PaymentSuccessScreen.dart';

class PaymentSelectionScreen extends StatefulWidget {
  static const routeName = '/payment-selection';

  const PaymentSelectionScreen({super.key});

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
        title: const Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                trailing: Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (bool? value) {},
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Add new card functionality
              },
              child: const Text('Add a new Card',
                  style: TextStyle(color: Colors.blue)),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Full name'),
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
                    decoration:
                        const InputDecoration(labelText: 'Email address'),
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
                    decoration:
                        const InputDecoration(labelText: 'Phone number'),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _proceedToPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize:
                          const Size(double.infinity, 50), // Adjust button size
                    ),
                    child: const Text('Proceed to payment'),
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
