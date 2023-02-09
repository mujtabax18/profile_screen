import 'package:flutter/material.dart';
import 'package:profile_screen/Widgets/appbarwidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarWidgets(
                editFunctionButtonAction: () {
                  print("edit functionality enabled");

                  //todo: Add functionality of edit profile button here.
                },
                backFunctionButtonAction: () {
                  print("go to previous screen");
                  //todo: Add functionality of back button here
                },
              ),
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                "t.arengard@gmail.com",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "I want to be rich, but I don't want to spend more, I want to live"
                  "forever and have smart children to take off my company",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CapsoulStyleWidget(
                      value: 'Home Body',
                    ),
                    CapsoulStyleWidget(
                      value: 'Tech Savvy',
                    ),
                    CapsoulStyleWidget(
                      value: 'Career Driven',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 0.8,
                          color: Colors.grey,
                          blurRadius: 1,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CapsoulStyleWidget(
                            value: 'Age: 25',
                            txtcolor: Colors.white,
                            bgcolor: Colors.blue,
                          ),
                          CapsoulStyleWidget(
                            value: 'Gender : Male',
                            txtcolor: Colors.white,
                            bgcolor: Colors.blue,
                          ),
                          CapsoulStyleWidget(
                            value: 'Country : Sweden',
                            txtcolor: Colors.white,
                            bgcolor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Praesent gravida id ex a faucibus. Pellentesque fringilla odio "
                        "at tortor semper, vitae mollis dui tempor"
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Praesent gravida id ex a faucibus. Pellentesque fringilla odio "
                        "at tortor semper, vitae mollis dui tempor",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        textScaleFactor: 1.2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              //todo: User social Media Link will go here
                            },
                            icon: const ImageIcon(
                                AssetImage("images/youtube.png"),
                                size: 40,
                                color: Colors.blue)),
                        IconButton(
                            onPressed: () {
                              //todo: User social Media Link will go here
                            },
                            icon: const ImageIcon(
                                AssetImage("images/discord.png"),
                                size: 40,
                                color: Colors.blue)),
                        IconButton(
                            onPressed: () {
                              //todo: User social Media Link will go here
                            },
                            icon: const ImageIcon(
                                AssetImage("images/linked.png"),
                                size: 40,
                                color: Colors.blue))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class CapsoulStyleWidget extends StatelessWidget {
  const CapsoulStyleWidget({
    required this.value,
    this.bgcolor: Colors.white,
    this.txtcolor: Colors.blue,
    super.key,
  });
  final Color txtcolor;
  final Color bgcolor;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgcolor,
      ),
      child: Text(
        value,
        textScaleFactor: 1.1,
        style: TextStyle(
          color: txtcolor,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
