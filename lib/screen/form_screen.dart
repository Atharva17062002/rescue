import 'package:flutter/material.dart';

import '../Dbmodel.dart';
import '../dbhelper/mongodb.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}
class _FormScreenState extends State<FormScreen> {
  // final _formkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pid = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _des = TextEditingController();
  String name ='';
  String pid = '';
  String location ='';
  String des = '' ;

  void initState() {
    _name.text = name;
    _pid.text = pid;
    _location.text = location;
    _des.text = des;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: MongoDatabase.getData(),
              builder: (context,AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    var totalData = snapshot.data.length;
                     return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return
                          display(MongoDbModel.fromJson(snapshot.data[index]));
                        });
                  } else {
                    return Center(
                      child: Text("No data"),
                    );
                  }
                }
              }
          )
      ),
      bottomNavigationBar: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Reject'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              //maximumSize: MaterialStateProperty.all(Size(2, 2))
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Accept'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
          )
        ],
      ),
    );
  }

  Widget display(MongoDbModel data){
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image.network(
              '${data.imageurl}',
              width: 50,
              height: 100,
              fit: BoxFit.fill,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.05,
        ),

        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey),
          child: Column(
            children: [
              buildTextField('Personal ID : ', '${data.personalid}'),
              buildTextField('Full Name : ', '${data.fname + data.lname}'),
              buildTextField('Location : ', '${data.location}'),
              buildTextField('Description : ', '${data.description}'),
            ],
          ),
        )
      ],
    );
  }
  Widget buildTextField(String labelText, String info) {
    return Padding(
      padding: EdgeInsets.only (bottom: 30),
      child: TextField(
        decoration: InputDecoration (
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


