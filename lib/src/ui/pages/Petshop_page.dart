import 'package:flutter/material.dart';
import 'package:softpati/src/ui/pages/drawer.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class ShoppingCart {
  List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    _items.add(product);
  }

  void removeItem(Product product) {
    _items.remove(product);
  }

  double calculateTotal() {
    return _items.fold(0, (sum, product) => sum + product.price);
  }
}

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final ShoppingCart _cart = ShoppingCart();

  List<Product> _availableProducts = [
    Product("Köpek maması", 20.0),
    Product("Kedi maması", 30.0),
    Product("Kuş Yemi", 15.0),
    Product("Köpek maması", 20.0),
    Product("Kedi maması", 30.0),
    Product("Kuş Yemi", 15.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         drawer:ComtDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Alışveriş',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _availableProducts.length,
              itemBuilder: (context, index) {
                final product = _availableProducts[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Container(
                      width: 120,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2)),
                              color: Colors.amber[700],
                            ),
                          ),
                          hoverColor: const Color.fromARGB(255, 249, 231, 237),
                          title: Text(product.name),
                          subtitle:
                              Text('\$${product.price.toStringAsFixed(2)}'),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromARGB(255, 146, 250, 150),
                            child: IconButton(
                              alignment: Alignment.center,
                              icon: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _cart.addItem(product);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          const Text('Sepete eklenenler',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: _cart.items.length,
              itemBuilder: (context, index) {
                final product = _cart.items[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Container(
                      width: 120,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2)),
                              color: Colors.amber[700],
                            ),
                          ),
                          title: Text(product.name),
                          subtitle:
                              Text('\$${product.price.toStringAsFixed(2)}'),
                          trailing: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromARGB(255, 247, 146, 139),
                            child: IconButton(
                              icon: Icon(
                                Icons.remove,
                                size: 15,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _cart.removeItem(product);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  color: Colors.white,
                ),
                height: 35,
                child: Center(
                  child: Text(
                    'Sepetim: \$${_cart.calculateTotal().toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(cart: _cart),
                  ),
                );
              },
              child: Text(
                'Ödeme Sayfasına Git',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                    title: Text('Ödeme Başarılım'),
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
