import 'package:flutter/material.dart';

import '../Dbmodel.dart';
import '../dbhelper/mongodb.dart';

class formscreen extends StatefulWidget {
  const formscreen({Key? key}) : super(key: key);

  @override
  State<formscreen> createState() => _formscreenState();
}

@override
class _formscreenState extends State<formscreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pid = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _des = TextEditingController();
  String name = 'Soyam';
  String pid = '014';
  String location = 'chennai';
  String des = 'found unconsious';

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
                        itemCount: totalData,
                        itemBuilder: (BuildContext context, int index) {
                          return
                          display(
                              MongoDbModel.fromJson(snapshot.data[index]));
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
    return Stack(
      children: [
        Positioned(
          top: 55,
          left: 40,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                'assest/home.jfif',
                width: 50,
                height: 300,
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
          left: 20,
          bottom: 30,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.grey),
            child: Form(
              key: _formkey,
              child: new ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      prefixText: ('Person id:'),
                    ),
                    controller: _pid,
                    onChanged: (String value) {
                      name = value;
                    },
                  ),


                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      prefixText: ('Name:'),
                    ),
                    controller: _name,
                    onChanged: (String value) {
                      name = value;
                      print('hiii');
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      prefixText: ('Location:'),
                    ),
                    controller: _location,
                    onChanged: (String value) {
                      name = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      prefixText: ('Description:'),
                    ),
                    controller: _des,
                    onChanged: (String value) {
                      name = value;
                    },
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
