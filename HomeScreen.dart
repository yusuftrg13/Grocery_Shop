import 'package:flutter/material.dart';
import 'package:market_shop/ProductScreen.dart'; // ProductScreen'ı import ettiğimiz alan

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(160),
                color: Colors.green[400],
              ),
              child: ClipOval(
                child: Image.asset(
                  'images/manav.jpg', //Resmimizi eklediğimiz alan
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 35), //Logo ile arasındaki mesafe
            Text(
              'Doğadan Manav',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Colors.green[600],
              ),
            ),
            Text('Bahçelerimizin sofralarınıza uzanan lezzet'),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductScreen()), //Giriş yap butonuna tıklandığı zaman bir login sayfası olmayacak ama ürün ekranına gidicek
                    );
                  },
                  child: Text('Giriş yap',style: TextStyle(color: Colors.black),),
                ),
                SizedBox(width: 25),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Kayıt Ol',style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Sosyal medya butonlarına tıklandığında yapılacak işlemler olmayacak
                  },
                  icon: Icon(Icons.facebook),
                ),
                IconButton(
                  onPressed: () {
                    // Sosyal medya butonlarına tıklandığında yapılacak işlemler olmayacak
                  },
                  icon: Icon(Icons.telegram),
                ),
                IconButton(
                  onPressed: () {
                    // Sosyal medya butonlarına tıklandığında yapılacak işlemler olmayacak
                  },
                  icon: Icon(Icons.mail),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Tüm hakları saklıdır © Copyright',style: TextStyle(fontSize: 10),)
          ],
        ),
      ),
    );
  }
}
