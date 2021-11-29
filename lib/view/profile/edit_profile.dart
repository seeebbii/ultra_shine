// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ultra_shine/view/home/widgets/text_fields.dart';

// // ignore: import_of_legacy_library_into_null_safe

// // ignore: import_of_legacy_library_into_null_safe
// i

// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
 
//   final TextEditingController emailField = TextEditingController();
//   final TextEditingController passwordField = TextEditingController();
//   final TextEditingController phoneField = TextEditingController();
//   final TextEditingController locationField = TextEditingController();
//   final TextEditingController firstnameField = TextEditingController();
//   final TextEditingController secondnameField = TextEditingController();
//   bool showPassword = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.teal,
//           ),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.settings,
//               color: Colors.teal,
//             ),
//             onPressed: () {
//               // Navigator.of(context).push(MaterialPageRoute(
//               //     builder: (BuildContext context) => SettingsPage()));
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               // Text(
//               //   "Edit Profile",
//               //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//               // ),
//               SizedBox(
//                 height: 15,
//               ),
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor),
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 color: Colors.black.withOpacity(0.1),
//                                 offset: Offset(0, 10))
//                           ],
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                 "https://www.clipartmax.com/png/middle/171-1717870_stockvader-predicted-cron-for-may-user-profile-icon-png.png",
//                               ))),
//                     ),
//                     Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor,
//                             ),
//                             color: Colors.teal,
//                           ),
//                           child: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 35,
//               ),
//               RegistrationTextField(
//                   controller: firstnameField,
//                   validator: (value) {},
//                   iconData: CupertinoIcons.person,
//                   hintText: 'First Name',
//                   hide: false,
//                   textInputType: TextInputType.name),
//               RegistrationTextField(
//                   controller: secondnameField,
//                   validator: (value) {},
//                   iconData: CupertinoIcons.person_alt,
//                   hintText: 'Last Name',
//                   hide: false,
//                   textInputType: TextInputType.name),
//               RegistrationTextField(
//                   controller: emailField,
//                   validator: (value) {},
//                   iconData: CupertinoIcons.mail,
//                   hintText: login.username,
//                   hide: false,
//                   textInputType: TextInputType.emailAddress),
//               RegistrationTextField(
//                   controller: passwordField,
//                   validator: (value) {},
//                   iconData: CupertinoIcons.lock,
//                   hintText: 'password',
//                   hide: false,
//                   textInputType: TextInputType.visiblePassword),
//               RegistrationTextField(
//                   controller: locationField,
//                   validator: (value) {},
//                   iconData: CupertinoIcons.location,
//                   hintText: 'Location',
//                   hide: false,
//                   textInputType: TextInputType.text),
//               SizedBox(
//                 height: 35,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlineButton(
//                     padding: EdgeInsets.symmetric(horizontal: 50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     onPressed: () {},
//                     child: Text("CANCEL",
//                         style: TextStyle(
//                             fontSize: 14,
//                             letterSpacing: 2.2,
//                             color: Colors.black)),
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       updateUser(firstnameField.text, firstnameField.text,
//                           passwordField.text, '031360606');
//                     },
//                     color: Colors.teal,
//                     padding: EdgeInsets.symmetric(horizontal: 50),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Text(
//                       "SAVE",
//                       style: TextStyle(
//                           fontSize: 14,
//                           letterSpacing: 2.2,
//                           color: Colors.white),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(
//       String labelText, TextInputType textInputType, bool isPasswordTextField) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 35.0),
//       child: TextField(
//         obscureText: isPasswordTextField ? showPassword : false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField
//                 ? IconButton(
//                     onPressed: () {
//                       setState(() {
//                         showPassword = !showPassword;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.remove_red_eye,
//                       color: Colors.grey,
//                     ),
//                   )
//                 : null,
//             contentPadding: EdgeInsets.only(bottom: 3),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: '',
//             hintStyle: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             )),
//       ),
//     );
//   }

//   Future<void> updateUser(String first, last, pass, phone) async {
//     try {
//       await shopifyCustomer.customerUpdate(
//         email: login.username,
//         firstName: first,
//         lastName: last,
//         password: pass,
//         customerAccessToken: login.accesstoken,
//         phoneNumber: '0310200020',
//         acceptsMarketing: true,
//       );

// //'Usamayousaf@Nutrify.com'
// //''123321'
//       // var username = user.displayName.toString();

//       // print(user.email + "User in existence");
//       //  var shopifyUser = user;
//     } on Exception catch (e) {
//       //var username = 'Guest';
//       print(e);
//     }
//   }
// }
