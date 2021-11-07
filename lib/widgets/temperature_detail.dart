import 'package:car_control/controller/home_controller.dart';
import 'package:car_control/utils/const.dart';
import 'package:car_control/widgets/temperature_button.dart';
import 'package:flutter/material.dart';

class TemperatureDetail extends StatelessWidget {
  const TemperatureDetail({
    Key? key,
    required this.tempController,
  }) : super(key: key);

  final HomeController tempController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempButtonWidget(
                  colorActive: primaryColor,
                  isActive: tempController.isCoolSelected,
                  svgSrc: "assets/icons/coolShape.svg",
                  title: "Cool",
                  press: tempController.updateCoolSelectedTab,
                ),
                SizedBox(
                  width: 12,
                ),
                TempButtonWidget(
                  colorActive: redColor,
                  isActive: !tempController.isCoolSelected,
                  svgSrc: "assets/icons/heatShape.svg",
                  title: "Heat",
                  press: tempController.updateCoolSelectedTab,
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_drop_up,
              size: 44,
            ),
          ),
          Text(
            "29 \u2103",
            style: TextStyle(
              fontSize: 72,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_drop_down,
              size: 44,
            ),
          ),
          Spacer(),
          Text("CURRENT TEMPERATURE"),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Inside".toUpperCase()),
                  Text(
                    "20\u2103",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OutSide".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  Text(
                    "20\u2103",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
