import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                CupertinoSliverNavigationBar(
                  leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: Colors.grey[400],
                    ),
                  ),
                  largeTitle: Text('Create Activity'),
                  border: null,
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Activity name'),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if ((value!.length > 120)) {
                          return '*Name shou􀋜d be max 120 characters';
                        } else {
                          print('Worked out fine');
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Ex: Cooking Class',
                        helperText: '*Name shou􀋜d be max 120 characters',
                      ),
                    ),
                  ),
                  Text('Activity Type'),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Ex: Cooking Class',
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('lib/assets/Rectangle 4.svg'),
                SizedBox(width: 2),
                SvgPicture.asset('lib/assets/Rectangle 3.svg'),
                SizedBox(width: 2),
                SvgPicture.asset('lib/assets/Rectangle 3.svg'),
              ],
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('Line Executed');
                  print(_formKey);
                  Navigator.push(
                    context,
                    PageTransition(
                        child: ThirdScreen(),
                        type: PageTransitionType.leftToRight),
                  );
                }
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
