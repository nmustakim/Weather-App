import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Widget child;
  const ReusableContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width ,

          decoration:  const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.white

                  ]


              )
          ),
      child: child,

    );
  }
}
