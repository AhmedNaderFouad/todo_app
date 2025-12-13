import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/custom_widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;

  TextEditingController nameController = TextEditingController();

  void takeImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void chooseImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: photo == null,
                          replacement: CircleAvatar(
                            radius: 120,
                            backgroundColor: Colors.black,
                            backgroundImage: Image.file(
                              File(photo?.path ?? ""),
                            ).image,
                          ),
                          child: CircleAvatar(
                            radius: 120,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.person,
                              size: 170,
                              color: Colors.blue,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        AppButton(
                          title: "Take a Picture From Camera",
                          onPressed: () {
                            takeImageFromCamera();
                          },
                        ),

                        const SizedBox(height: 25),

                        AppButton(
                          title: "Upload Photo From Gallery",
                          onPressed: () {
                            chooseImageFromGallery();
                          },
                        ),

                        const SizedBox(height: 25),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 1.5,
                            ),
                          ),
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 25),
                        AppButton(title: "Done", onPressed: () {}),
                        SizedBox(height: 30),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
