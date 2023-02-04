import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rescue/dbhelper/mongodb.dart';

import '../Dbmodel.dart';
import 'form_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 40,
            ),
          ),
          backgroundColor: Colors.black,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 25,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 25,
                            )),
                      ),
                    ],
                  )),
            )
          ],
        ),
        body: SafeArea(
            child: FutureBuilder(
                future: MongoDatabase.getData(),
                builder: (context, AsyncSnapshot snapshot) {
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
                            return displayCard(
                                MongoDbModel.fromJson(snapshot.data[index]));
                          });
                    } else {
                      return Center(
                        child: Text("No data"),
                      );
                    }
                  }
                })));
  }

  Widget displayCard(MongoDbModel data) {
    return Card(
      color: Color(0xff1B1C1E),
      child: ListTile(
        contentPadding: EdgeInsets.all(4),
        leading: CircleAvatar(
          backgroundColor: Colors.yellow,
          radius: 25,
          child: Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Text(
                  "${data.fname + data.lname}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Ionicons.location,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "${data.location}",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Text(
                  "${data.description}",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (contex) => FormScreen()));
          },
          icon: Icon(
            CupertinoIcons.right_chevron,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
