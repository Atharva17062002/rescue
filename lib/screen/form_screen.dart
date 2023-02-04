import 'package:flutter/material.dart';

import '../Dbmodel.dart';
import '../dbhelper/mongodb.dart';

class FormScreen extends StatefulWidget {
  const FormScreen(
      {Key? key,
      required this.personalid,
      required this.lname,
      required this.fname,
      required this.location,
      required this.description,
      required this.imageurl})
      : super(key: key);

  final String personalid;
  final String fname;
  final String lname;
  final String imageurl;
  final String location;
  final String description;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formkey = GlobalKey<FormState>();
  // final TextEditingController _name = TextEditingController();
  // final TextEditingController _pid = TextEditingController();
  // final TextEditingController _location = TextEditingController();
  // final TextEditingController _des = TextEditingController();
  // late String name;
  // late String pid;
  // late String location;
  // late String des;
  // late String imageurl;

  // void initState() {
  //   _name.text = name;
  //   _pid.text = pid;
  //   _location.text = location;
  //   _des.text = des;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.network(
                widget.imageurl,
                width: 50,
                height: 100,
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  buildTextField('Personal ID : ', widget.personalid),
                  buildTextField('Full Name : ', widget.fname),
                  buildTextField('Location : ', widget.location),
                  buildTextField('Description : ', widget.description),
                ],
              ),
            ),
          )
        ],
      )),
      // bottomNavigationBar: Row(
      //   children: [
      //     SizedBox(
      //       width: MediaQuery.of(context).size.width * 0.03,
      //     ),
      //     ElevatedButton(
      //       onPressed: () {},
      //       child: Text('Reject'),
      //       style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all(Colors.red),
      //         //maximumSize: MaterialStateProperty.all(Size(2, 2))
      //       ),
      //     ),
      //     SizedBox(
      //       width: MediaQuery.of(context).size.width * 0.5,
      //     ),
      //     ElevatedButton(
      //       onPressed: () {},
      //       child: Text('Accept'),
      //       style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all(Colors.green),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  // Widget display(MongoDbModel data){
  //   return
  // }
  Widget buildTextField(String labelText, String info) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        onSubmitted: (text) {
          MongoDatabase.setData(widget.personalid, text);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: info,
          hintStyle: TextStyle(),
        ),
      ),
    );
  }
}
