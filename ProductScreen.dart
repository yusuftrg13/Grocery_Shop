import 'dart:math';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoş geldiniz!'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Bugünün Önerileri',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            //Ürünlerin olacağı GridView'leri ekleyelim
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 4, // 4 adet görsel ekleyeceğiz
              itemBuilder: (context, index) {
                return ProductItem(
                  imageIndex: index + 1,
                  oldPrice: generateRandomPrice(),
                  newPrice: generateRandomPrice(),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Tüm ürünler butonuna tıklandığında yapılacak işlemler şuan olmayacak
              },
              child: Text('Tüm Ürünleri İncele',style: TextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final int imageIndex; // Resim indeksi
  final double oldPrice; // Eski fiyat
  final double newPrice; // Yeni fiyat

  const ProductItem({
    Key? key,
    required this.imageIndex,
    required this.oldPrice,
    required this.newPrice,
  }) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Görsel tıklandığında yapılacak işlemler şuan olmayacak
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
              image: DecorationImage(
                image: AssetImage('assets/products/sebze${widget.imageIndex}.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    itemCount++;
                  });
                },
                icon: Icon(Icons.add,color: Colors.white,),
              ),
              Text(
                '$itemCount',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (itemCount > 0) {
                      itemCount--;
                    }
                  });
                },
                icon: Icon(Icons.remove,                color: Colors.white,
),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eski Fiyat: \$${widget.oldPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                'Yeni Fiyat: \₺${widget.newPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductScreen(),
  ));
}

// Rastgele fiyat üretme fonksiyonunu kodlayalım
double generateRandomPrice() {
  Random random = Random();
  return (random.nextDouble() * 20) + 10; // 10 ile 110 arasında rastgele bir fiyat
}
