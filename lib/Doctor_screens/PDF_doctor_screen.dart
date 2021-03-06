import 'dart:io';
import 'dart:math';
import 'package:DGEST/Constins.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class PDFDoctorScreen extends StatefulWidget {
  final String courseID;
  PDFDoctorScreen({@required this.courseID});
  @override
  _PDFDoctorScreenState createState() => _PDFDoctorScreenState();
}

class _PDFDoctorScreenState extends State<PDFDoctorScreen> {
  final _fireStore = FirebaseFirestore.instance;

  // // Future<String> uploadPdfToStorage(File pdfFile) async {
  // //   try {
  // //     Reference ref = FirebaseStorage.instance
  // //         .ref()
  // //         .child('pdfs/${DateTime.now().millisecondsSinceEpoch}');
  // //     UploadTask uploadTask =
  // //         ref.putFile(pdfFile, SettableMetadata(contentType: 'pdf'));
  // //
  // //     TaskSnapshot snapshot = await uploadTask;
  // //
  // //     String url = await snapshot.ref.getDownloadURL();
  // //
  // //     print("url:$url");
  // //     return url;
  // //   } catch (e) {
  // //     return null;
  // //   }
  // // }
  //String _fileName;
  //String _path;
  //Map<String, String> _paths;
  // String _extension;
  //bool _loadingPath = false;
  // bool _multiPick = false;
  // bool _hasValidMime = false;
  // FileType _pickingType;
  // TextEditingController _controller = new TextEditingController();
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() => _extension = _controller.text);
  // }
  //
  // void _openFileExplorer() async {
  //   if (_pickingType != FileType.CUSTOM || _hasValidMime) {
  //     setState(() => _loadingPath = true);
  //     try {
  //       if (_multiPick) {
  //         _path = null;
  //         _paths = await FilePicker.getMultiFilePath(
  //             type: _pickingType, fileExtension: _extension);
  //       } else {
  //         _paths = null;
  //         _path = await FilePicker.getFilePath(
  //             type: _pickingType, fileExtension: _extension);
  //       }
  //     } on PlatformException catch (e) {
  //       print("Unsupported operation" + e.toString());
  //     }
  //     if (!mounted) return;
  //     setState(() {
  //       _loadingPath = false;
  //       _fileName = _path != null
  //           ? _path.split('/').last
  //           : _paths != null
  //               ? _paths.keys.toString()
  //               : '...';
  //     });
  //   }
  // }
  //final mainReference = FirebaseDatabase.instance.reference().child('Database');

  Future getPdfAndUpload() async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    File file =
        await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'pdf');
    String fileName = 'PDF_Files/$randomName.pdf';
    print(fileName);
    print('${file.readAsBytesSync()}');
    await FirebaseStorage.instance
        .ref()
        .child(fileName)
        .putData(file.readAsBytesSync());
    String url = await FirebaseStorage.instance.ref(fileName).getDownloadURL();
    print(url);

    // _fireStore
    //     .collection('Doctors')
    //     .doc('${loggedInUSer.email}')
    //     .update({'pdf': url});

    _fireStore
        .collection('Doctors')
        .doc('${loggedInUSer.email}')
        .collection('Courses')
        .doc('${widget.courseID}')
        .collection('week$selectedCard')
        .add({'url': url, 'name': randomName});

    _fireStore.collection('Students').get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        _fireStore
            .collection('Students')
            .doc(result.id)
            .collection('Courses')
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((document) {
            if (document.id == widget.courseID) {
              _fireStore
                  .collection('Students')
                  .doc(result.id)
                  .collection('Courses')
                  .doc(document.id)
                  .collection('week$selectedCard')
                  .add({'url': url, 'name': randomName});
              //.update({'pdf': url});
            }
            //print(result.data());
            // _fireStore
            //     .collection('Students')
            //     .doc(result.id)
            //     .collection('Courses')
            //     .doc('${widget.courseID}')
            //     .update({'pdf': url});
          });
        });
      });
    });
  }

  Widget pdfUrl(String documentId) {
    return StreamBuilder(
      stream: _fireStore
          .collection('Doctors')
          .doc(documentId)
          .collection('Courses')
          .doc('${widget.courseID}')
          .collection('week$selectedCard')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.hasData) {
          final documents = snapshot.data.docs;
          List<Column> courseWidgets = [];
          for (var field in documents) {
            String fieldDataArray = field.get('url');
            String pdfName = field.get('name');
            final courseWidget = Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black54),
                    //elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () async {
                    String url = '$fieldDataArray';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text('$pdfName'),
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            );
            courseWidgets.add(courseWidget);
          }
          return ListView(
            children: courseWidgets,
          );
        }
        return Text('LOADING...');
      },
    );
  }

  // Future savePdf(List<int> asset, String name) async {
  //   await FirebaseStorage.instance.ref().child(fileName).putData(file.readAsBytesSync());
  //   String url = await FirebaseStorage.instance.ref(fileName).getDownloadURL();
  //   //StorageReference reference = FirebaseStorage.instance.ref().child(name);
  //   //StorageUploadTask uploadTask = reference.putData(asset);
  //   //String url = await (await uploadTask.onComplete).ref.getDownloadURL();
  //   print(url);
  //   documentFileUpload(url);
  //   return url;
  // }

  // void documentFileUpload(String downloadURL) {
  //   _fireStore
  //       .collection('Doctors')
  //       .doc('${loggedInUSer.email}')
  //       .update({'pdf': downloadURL});
  // }
  @override
  Widget build(BuildContext context) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.teal,
    //       title: Text("Upload PDF"),
    //       leading: IconButton(
    //         icon: Icon(Icons.arrow_back_ios),
    //         color: Colors.white,
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //     ),
    //     body: BackgroundImage(
    //       image: 'images/sora5a.jpeg',
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {},
    //       child: Icon(
    //         Icons.add,
    //         color: Colors.black,
    //       ),
    //       backgroundColor: Colors.teal,
    //     ),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDoctorColor,
        title: Text(
          "Upload PDF",
          style: kAppBarTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BackgroundImage(
        image: 'images/B4.jpeg',
        child: SafeArea(
          child: Container(
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                // ListView(
                //   children: [
                //     AttendanceWidget('PDF', 'Week 1'),
                //     AttendanceWidget('PDF', 'Week 2'),
                //   ],
                // ),
                // Builder(
                //   builder: (BuildContext context) => _loadingPath
                //       ? Padding(
                //           padding: EdgeInsets.only(bottom: 10.0),
                //           child: CircularProgressIndicator())
                //       : _path != null || _paths != null
                //           ? Container(
                //               decoration: BoxDecoration(
                //                 color: Color(0xFF06D6A0),
                //                 borderRadius: BorderRadius.circular(50.0),
                //               ),
                //               padding: EdgeInsets.only(bottom: 30.0),
                //               height: MediaQuery.of(context).size.height * 0.50,
                //               child: Padding(
                //                 padding: EdgeInsets.all(15.0),
                //                 child: Scrollbar(
                //                     child: ListView.separated(
                //                   itemCount: _paths != null && _paths.isNotEmpty
                //                       ? _paths.length
                //                       : 1,
                //                   itemBuilder:
                //                       (BuildContext context, int index) {
                //                     final bool isMultiPath =
                //                         _paths != null && _paths.isNotEmpty;
                //                     final String name = 'File : ' +
                //                         (isMultiPath
                //                             ? _paths.keys
                //                             : _fileName ?? '...');
                //                     final path = isMultiPath
                //                         ? _paths.values.toString()
                //                         : _path;
                //                     return ListTile(
                //                       title: Text(
                //                         name,
                //                       ),
                //                       subtitle: Text(path),
                //                     );
                //                   },
                //                   separatorBuilder:
                //                       (BuildContext context, int index) =>
                //                           Divider(),
                //                 )),
                //               ),
                //             )
                //           : Container(),
                // ),

                WidgetContainers(
                  widgetColor: kDoctorColor,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: pdfUrl(loggedInUSer.email),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kDoctorColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        StadiumBorder()),
                  ),
                  onPressed: () async {
                    await getPdfAndUpload();
                    final messageBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                          bottom: 50.0, left: 20.0, right: 20.0),
                      backgroundColor: kDoctorColor,
                      content: Text(
                        'You Uploaded PDF File',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                      duration: Duration(seconds: 10),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(messageBar);
                  },
                  child: Text("Upload New PDF"),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
