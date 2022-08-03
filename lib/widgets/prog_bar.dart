import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProgBar extends StatelessWidget {
  final double progRatio;
  ProgBar(this.progRatio);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(199, 237, 232, 0.5),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 20,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(
                left: 13,
              ),
              child: Text(
                "Today's Progress",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15,
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 9,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              height: 40,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(143, 227, 216, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: progRatio,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(18, 120, 106, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
