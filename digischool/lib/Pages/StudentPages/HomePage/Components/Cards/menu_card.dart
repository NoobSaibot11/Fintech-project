import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final int numericalFigure;
  final Function(int) onFigureSelected;

  const MenuCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.numericalFigure,
    required this.onFigureSelected
  }) : super(key: key);

  Color _getColorForNumericalFigure(int figure) {
    if (figure > 70) {
      return Colors.green;
    } else if (figure >= 50 && figure <= 70) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final figureColor = _getColorForNumericalFigure(numericalFigure);

    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 10, left: 10, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: Card(
          elevation: 0.0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.blue),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style:const TextStyle(color: Colors.black)),
                Text('$numericalFigure', style: TextStyle(color: figureColor)),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: (){
              onTap();
              onFigureSelected(numericalFigure);
            },
          ),
        ),
      ),
    );
  }
}
