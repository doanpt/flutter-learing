import 'package:car_control/models/tyre_psi.dart';
import 'package:car_control/utils/const.dart';
import 'package:flutter/material.dart';

class TirePsiCard extends StatelessWidget {
  const TirePsiCard({
    Key? key,
    required this.isBottomTwoTire,
    required this.tyrePsi,
  }) : super(key: key);

  final TyrePsi tyrePsi;
  final bool isBottomTwoTire;

  @override
  Widget build(BuildContext context) {
    print("${tyrePsi.temp}  - ${tyrePsi.psi}");
    return Container(
      padding: EdgeInsets.all(
        defaultPadding,
      ),
      decoration: BoxDecoration(
        color:
            tyrePsi.isLowPressure ? redColor.withOpacity(0.2) : Colors.white10,
        border: Border.all(
          color:
              tyrePsi.isLowPressure ? redColor.withOpacity(0.4) : primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: isBottomTwoTire
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lowerPressureText(context),
                Spacer(),
                psiText(
                  context,
                  text: tyrePsi.psi.toString(),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "${tyrePsi.temp}\u2103",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                psiText(
                  context,
                  text: tyrePsi.psi.toString(),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "${tyrePsi.temp}\u2103",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                lowerPressureText(context),
              ],
            ),
    );
  }

  Column lowerPressureText(BuildContext context) {
    return Column(
      children: [
        Text(
          "Low".toUpperCase(),
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          "Pressure".toUpperCase(),
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Text psiText(BuildContext context, {required String text}) {
    return Text.rich(
      TextSpan(
        text: text,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
        children: [
          TextSpan(
            text: " psi",
            style: TextStyle(
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
