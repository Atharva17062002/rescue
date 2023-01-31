import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'form_screen.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(1, 10, 255, 15),
                  child: Icon(Icons.menu,size: 35,),
                ),

              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                    child: Stack(
                      children: [
                        CircleAvatar(backgroundColor: Colors.yellow,
                          radius: 25,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.person,color: Colors.black,size: 30,))
                      ],
                    )
                ),
              )
            ],
          )
        ],
      ),
      body:ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color:Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      // color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(1,12, 5, 3),
                            child: Stack( children: [
                              CircleAvatar(backgroundColor: Colors.yellow,
                                radius: 25,),
                              IconButton(onPressed: (){},
                                  icon: Icon(Icons.person,color: Colors.black,size: 30,))
                            ],),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            children: [
                              Text('Atharva'),
                              Row(children: [
                                IconButton(onPressed: (){},
                                    icon: Icon(Ionicons.location_outline)),
                                Text('Potheri'),

                              ],),
                              Text('Found Unconsious'),
                            ],
                          ),
                          SizedBox(width: 120,),
                          IconButton(onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>const formscreen())
                            );
                          },
                              icon: Icon(Icons.arrow_forward_ios)
                          ),

                        ],
                      )

                  ),
                  SizedBox(height: 17,)
                ]
            );
          }
      ),
    );
  }

}
