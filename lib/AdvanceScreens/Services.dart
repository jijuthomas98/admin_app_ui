import 'package:admin_app_ui/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_app_ui/routes/package_router.dart' as router;


class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  FirestoreService serviceData;
  @override
  Widget build(BuildContext context) {
    serviceData = Provider.of<FirestoreService>(context, listen: false);
    return MaterialApp(
      onGenerateRoute: router.serviceRoutes,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onTap: () => Navigator.pop(context),
          ),
          title: Text(
            'SERVICES',
            style: TextStyle(
              color: Colors.black,
            ),
          ),

        ),
        body: StreamBuilder(
            stream: serviceData.getStreamServices(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return CircularProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  DocumentSnapshot service = snapshot.data.documents[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, service['fileName']);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      child: Card(
                        color: Color(int.parse(service['color'])),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      service['title'],
                                      style: TextStyle(
                                        fontFamily: 'inter',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      service['subText'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'inter',
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image(
                                image: NetworkImage(service['imgUrl']),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}