
import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {

  void PaywithPayHere()
  {
    Map paymentObject = {
      "sandbox": true,                 // true if using Sandbox Merchant ID
      "merchant_id": "1211149",        // Replace your Merchant ID
      "notify_url": "http://sample.com/notify",
      "order_id": "ItemNo12345",
      "items": "Hello from Flutter!",
      "amount": "50.00",               // Recurring amount
      "recurrence": "1 Month",         // Recurring payment frequency
      "duration": "1 Year",            // Recurring payment duration
      "startup_fee": "10.00",          // Extra amount for first payment
      "currency": "LKR",
      "first_name": "Saman",
      "last_name": "Perera",
      "email": "samanp@gmail.com",
      "phone": "0771234567",
      "address": "No.1, Galle Road",
      "city": "Colombo",
      "country": "Sri Lanka",
      "delivery_address": "No. 46, Galle road, Kalutara South",
      "delivery_city": "Kalutara",
      "delivery_country": "Sri Lanka",
      "custom_1": "",
      "custom_2": ""
    };

    PayHere.startPayment(
        paymentObject,
            (paymentId) {
          print("Recurring Payment Success. Payment Id: $paymentId");
        },
            (error) {
          print("Recurring Payment Failed. Error: $error");
        },
            () {
          print("Recurring Payment Dismissed");
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          children: [
            Container(
              child: ElevatedButton(
                onPressed: (){
                  PaywithPayHere();
                },
                child: Text('bt'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
