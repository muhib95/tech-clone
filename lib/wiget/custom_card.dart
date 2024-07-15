import 'package:flutter/material.dart';
import 'package:startech/utils/colors.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final IconData? icon;

  const CustomCard({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.7,
      child: Card(
        semanticContainer: false,
        elevation: 15,
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              icon,
              color: AppColor.logoColor,
            ),
            backgroundColor: AppColor.avaterbg,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
