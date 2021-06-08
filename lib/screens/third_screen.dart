import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  TextEditingController startdateController = TextEditingController();
  TextEditingController enddateController = TextEditingController();

  late DateTime startDate;
  late DateTime endDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        startDate = pickedDate;
        startdateController.text = DateFormat('MMM dd,yyyy').format(startDate);
      });
    });
  }

  void _endDatePicker() {
    showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: startDate,
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        endDate = pickedDate;
        enddateController.text = DateFormat('MMM dd,yyyy').format(endDate);
      });
    });
  }

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
                  largeTitle: Text('Date of activity'),
                  border: null,
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start date'),
                  Expanded(
                    child: TextFormField(
                      controller: startdateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Select a date';
                        }
                      },
                      onTap: _presentDatePicker,
                      decoration: InputDecoration(
                        hintText: 'Dec 02,2020',
                      ),
                    ),
                  ),
                  Text('End date'),
                  Expanded(
                    child: TextFormField(
                      controller: enddateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ERROR';
                        }
                      },
                      onTap: _endDatePicker,
                      decoration: InputDecoration(
                        hintText: 'Dec 20,2020',
                        helperText:
                            '*End Date should be greater than Start Date',
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
            Container(
              child: Row(
                children: [
                  SvgPicture.asset('lib/assets/Rectangle 3.svg'),
                  SizedBox(width: 2),
                  SvgPicture.asset('lib/assets/Rectangle 4.svg'),
                  SizedBox(width: 2),
                  SvgPicture.asset('lib/assets/Rectangle 3.svg'),
                ],
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
              onPressed: () {},
              child: Text(
                'OK',
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
