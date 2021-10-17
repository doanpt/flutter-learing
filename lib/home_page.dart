import 'package:flutter/material.dart';
import 'package:video_player_app/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30.0, top: 10, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Training",
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Training",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageDetail,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.gradientFirst.withOpacity(0.8),
                      AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 10,
                      color: AppColor.gradientSecond.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 25,
                    bottom: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Training",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.homePageContainerTextSmall,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Legs toning\nand Glutes Workout",
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColor.homePageContainerTextSmall,
                        ),
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.timer,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "60 min",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 8)),
                              ],
                            ),
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
