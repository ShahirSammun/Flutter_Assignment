import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Cake', price: 300),
    Product(name: 'Chips', price: 20),
    Product(name: 'Biscuit', price: 70),
    Product(name: 'Drinks', price: 80),
    Product(name: 'Milk', price: 350),
    Product(name: 'Pastry', price: 400),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(products: products)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            onBuyNowPressed: () {
              setState(() {
                products[index].incrementCounter();
                if (products[index].counter == 5) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Congratulations!'),
                      content: Text('You\'ve bought 5 ${products[index].name}!'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                }
              });
            },
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});

  void incrementCounter() {
    counter++;
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onBuyNowPressed;

  ProductItem({required this.product, required this.onBuyNowPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: TextButton(
        child: Text('Buy Now (${product.counter})'),
        onPressed: onBuyNowPressed,
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  int getTotalBought() {
    int total = 0;
    for (var product in products) {
      total += product.counter;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products Bought: ${getTotalBought()}'),
      ),
    );
  }
}

