import 'package:admin_app_ui/components/navigation_bar.dart';
import 'package:admin_app_ui/constants.dart';
import 'package:flutter/material.dart';

class AddServicePic extends StatefulWidget {
  @override
  _AddServicePicState createState() => _AddServicePicState();
}

class _AddServicePicState extends State<AddServicePic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Photo upload'),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Add Photo', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a short description',
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomHomeNavButton(),
    );
  }
}
