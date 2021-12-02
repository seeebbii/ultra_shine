import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shine/app/constant/image_paths.dart';
import 'package:ultra_shine/app/utils/colors.dart';
import 'package:ultra_shine/view/home/widgets/text_fields.dart';

class PersonalInfo extends StatefulWidget {
  PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController emailField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();
  final TextEditingController phoneField = TextEditingController();
  final TextEditingController locationField = TextEditingController();
  final TextEditingController firstnameField = TextEditingController();
  final TextEditingController secondnameField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body:
            profileView() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                child: const Icon(Icons.arrow_back_ios,
                    size: 24, color: Colors.white),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              const Text(
                'Personal Info',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 24, width: 24)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: Image.asset(
                    ImagePaths.tireBackground,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                _infoTiles('Name'),
                _infoTiles('Email'),
                _infoTiles('ContactNumber'),
                _infoTiles('City'),
                _infoTiles('Country'),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 60,
                      width: 350,
                      child: const Align(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ))
      ],
    );
  }

  Padding _infoTiles(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            ),
          ),
          Container(
            height: 55,
            child: InputTextfield(
                controller: firstnameField,
                validator: (value) {},
                hintText: title,
                hide: false,
                textInputType: TextInputType.name),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1.0, color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
