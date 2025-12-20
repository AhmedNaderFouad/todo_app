import 'package:flutter/material.dart';
import 'package:todo_app/custom_widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Nader",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Have a Nice Day",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.asset(
                      "assets/images/my_image.jpg",
                    ).image,
                  ),
                ],
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "October 30, 2023",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 150,
                    child: AppButton(title: "+ Add Task", onPressed: () {}),
                  ),
                ],
              ),

              SizedBox(height: 30),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text("OCT", style: TextStyle(color: Colors.white)),
                          Text(
                            "30",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("MON", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),

                    SizedBox(width: 35),
                    calendarBox("OCT", "1", "SUN"),
                    SizedBox(width: 35),
                    calendarBox("OCT", "31", "TUE"),
                    SizedBox(width: 35),
                    calendarBox("NOV", "1", "WED"),
                    SizedBox(width: 35),
                    calendarBox("NOV", "2", "THU"),
                    SizedBox(width: 35),
                    calendarBox("NOV", "3", "FRI"),
                  ],
                ),
              ),

              SizedBox(height: 30),

              taskCard(
                "Studying Statistics - 1",
                "04:25 AM - 06:40 AM",
                Colors.indigo,
              ),
              taskCard(
                "HangOut  - 2",
                "06:27 PM - 08:42 PM",
                Colors.pinkAccent,
              ),
              taskCard(
                "Go To GYM - 3",
                "09:27 PM - 11:43 PM",
                Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget calendarBox(String month, String day, String weekDay) {
    return Column(
      children: [
        Text(
          month,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(day, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(
          weekDay,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget taskCard(String title, String time, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(time, style: TextStyle(color: Colors.white70)),
                SizedBox(height: 15),
                Text(
                  "I will do This Task",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          Container(
            width: 1,
            height: 60,
            color: Colors.white24,
            margin: EdgeInsets.symmetric(horizontal: 15),
          ),

          RotatedBox(
            quarterTurns: 3,
            child: Text(
              "TODO",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
