import "package:flutter/material.dart";

class SizedCell extends StatelessWidget {
  final Color bgColor;
  final String cellText;
  final FontWeight fw;

  const SizedCell(this.cellText,
      {Key? key,
      this.bgColor = const Color.fromARGB(255, 220, 220, 255),
      this.fw = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        color: bgColor,
        child: Center(
          heightFactor: 3,
          child: Text(cellText,
              textAlign: TextAlign.center, style: TextStyle(fontWeight: fw)),
        ),
      ),
    );

    // return Container(
    //     color: bgColor,
    //     child: Center(
    //       heightFactor: 3,
    //       child: TableCell(
    //         child: Text(
    //           cellText,
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             fontWeight: fw,
    //           ),
    //         ),
    //       ),
    //     ));
  }
}
