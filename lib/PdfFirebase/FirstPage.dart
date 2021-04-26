// import 'dart:math';
// import 'package:DGEST/Student_screens/Student_screen.dart';
// import 'package:file_picker/file_picker.dart';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }
//
// class _FirstPageState extends State<FirstPage> {
//   @override
//   Widget build(BuildContext context) {
//     return BackgroundImage(
//       image: 'images/sora5a.jpeg',
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.teal,
//           title: Text("Upload PDF"),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             getPdfAndUpload();
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.black,
//           ),
//           backgroundColor: Colors.teal,
//         ),
//       ),
//     );
//   }
//
//   Future getPdfAndUpload() async {
//     var rng = new Random();
//     String randomName = "";
//     for (var i = 0; i < 20; i++) {
//       print(rng.nextInt(100));
//       randomName += rng.nextInt(100).toString();
//     }
//     FilePickerResult result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//     String fileName = '$randomName.pdf';
//     savePdf(result.toString(), fileName);
//     //function call
//   }
//
//   savePdf(asset, String name) async {
//     await FirebaseStorage.instance.ref().child(name).putFile(asset);
//     String url = await FirebaseStorage.instance.ref(name).getDownloadURL();
//     //documentFileUpload(url);
//     //function call
//   }
//
//   // String createCryptoRandomString([int length = 32]) {
//   //   final Random _random = Random.secure();
//   //   var values = List<int>.generate(length, (i) => _random.nextInt(256));
//   //   return base64Url.encode(values);
//   // }
//
//   // void documentFileUpload(String str) {
//   //   var data = {
//   //     "PDF": str,
//   //     "FileName": "My New Task",
//   //   };
//   //   mainReference.child(createCryptoRandomString()).set(data).then((v) {
//   //     print("Store Successfully");
//   //   });
//   // }
// }
