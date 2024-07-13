import 'package:flutter/material.dart';
import 'PaymentSuccessScreen.dart';

class PaymentSelectionScreen extends StatefulWidget {
  static const routeName = '/payment-selection';

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
        title: Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                trailing: Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (bool? value) {},
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Add new card functionality
              },
              child:
                  Text('Add a new Card', style: TextStyle(color: Colors.blue)),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Full name'),
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
                    decoration: InputDecoration(labelText: 'Email address'),
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
                    decoration: InputDecoration(labelText: 'Phone number'),
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _proceedToPayment,
                    child: Text('Proceed to payment'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize:
                          Size(double.infinity, 50), // Adjust button size
                    ),
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
