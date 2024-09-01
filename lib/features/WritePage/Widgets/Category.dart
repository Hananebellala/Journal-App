import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final Function(String, Color) onCategorySelected;

  const Category({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 298,
      height: 298,
      decoration: BoxDecoration(
        color: const Color(0XFF7469B6),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCategoryButton(context, 'Random', Color(0XFFBBE9FF)),
          _buildCategoryButton(context, 'Memory', Color(0XFFF19ED2)),
          _buildCategoryButton(context, 'Family', Color(0XFFAD88C6)),
          _buildCategoryButton(context, 'Daily Life', Color(0XFFFFD9A3)),
          _buildCategoryButton(context, 'Future Me', Color(0XFFFFB1B4)),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String name, Color color) {
    return GestureDetector(
      onTap: () {
        onCategorySelected(name, color);
      },
      child: Container(
        width: 257,
        height: 29,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'CourierPrime',
          ),
        ),
      ),
    );
  }
}
