import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Result_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(150, 157, 245, 1), Colors.white])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'Assets/Images/OIP__6_-removebg-preview.png',
              height: 400,
              width: 500,
            ),
            const Text(
              'Weather',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Forecasts',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (conyext) {
                    return ResultPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(200, 60),
                ),
                child: const Text(
                  'Get Start',
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                  ),
                )),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
