import 'package:flutter/material.dart';

class formscreen extends StatefulWidget {
  const formscreen({Key? key}) : super(key: key);

  @override
  State<formscreen> createState() => _formscreenState();
}
final _formkey= GlobalKey<FormState>();
class _formscreenState extends State<formscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Image.asset('assest/home.jfif'),
          Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                        labelText:'Name'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
