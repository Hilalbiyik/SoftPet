
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softpati/view/petShop/petshop_page.dart';
 
 

class PaymentPage extends StatelessWidget {
  final ShoppingCart cart;

  const PaymentPage({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödeme Sayfası'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Ücret: \$${cart.calculateTotal().toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                // Simulate a payment process
                // In a real-world scenario, you would integrate with a payment gateway
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Ödeme Başarılı'),
                    content: Text('Satın aldığınız için teşekkür ederiz!'),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Tamam',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Şimdi Öde',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
