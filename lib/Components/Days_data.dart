import 'package:flutter/material.dart';
import 'package:weather_app/Models/DaysModel.dart';

class DaysData extends StatelessWidget {
  DaysData({super.key, this.daysmodel});
  Daysmodel? daysmodel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 50,
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ' Day ${daysmodel?.dayNumber}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '${daysmodel?.imagePath}',
                height: 60,
                width: 50,
              ),
              Text(
                '${daysmodel?.stateweather}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' ${daysmodel?.temp} ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
                indent: 10,
                endIndent: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
