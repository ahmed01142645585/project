
import 'package:DGEST/Constins.dart';
import 'package:DGEST/Desgin_classes/Desgin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PDFStudentScreen extends StatefulWidget {
  @override
  _PDFStudentScreenState createState() => _PDFStudentScreenState();
}

class _PDFStudentScreenState extends State<PDFStudentScreen> {
  final _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget pdfUrl(String documentId) {
    return FutureBuilder(
      future: _fireStore
          .collection('Students')
          .doc(documentId)
          .collection('Courses')
          .doc('Computer Network')
          .collection('PDF')
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.hasData) {
          final documents = snapshot.data.docs;
          List<ElevatedButton> courseWidgets = [];
          for (var field in documents) {
            String fieldDataArray = field.get('url');
            final courseWidget = ElevatedButton(
              onPressed: () async {
                  String url = '$fieldDataArray';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                }
                },

              child: Text('$fieldDataArray'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF06D6A0),
        title: Text("PDF Files"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BackgroundImage(
        image: 'images/sora5a.jpeg',
        child: SafeArea(
          child: Container(
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                WidgetContainers(
                  height: MediaQuery.of(context).size.height - 150,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: pdfUrl('${loggedInUSer.email}'),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
