import 'package:flutter/material.dart';
import '../models/User.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name), backgroundColor: Colors.teal),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: profileImage()),
                  Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "UID: ${user.id}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    'Name: ${user.name}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Phone: ${user.phone}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                            Text(
                              'Email: ${user.email}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(height: 20),
              buildInfoCard('Company Name:', user.company.name),
              SizedBox(height: 20),
              buildInfoCard('Website:', user.website),
              SizedBox(height: 20),
              buildInfoCard('Address:',
                  '${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}'),
            ],
          )),
    );
  }

  Widget profileImage() {
    final firstLetter = user.name.isNotEmpty ? user.name[0] : '';
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            child: Text(
              firstLetter,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            backgroundColor: Colors.blue,
            radius: 50,
          ),
        )
        // Positioned(
        //     right: 30,
        //     bottom: 0,
        //     child: InkWell(
        //         onTap: () {
        //           showModalBottomSheet(
        //               context: context,
        //               builder: (builder) => bottomSheet(context));
        //         },
        //         child: Container(
        //             width: 20,
        //             height: 20,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(20),
        //                 color: Colors.white),
        //             child: Icon(
        //               Icons.camera_alt_rounded,
        //               color: Colors.black54,
        //               size: 22,
        //             ))))
      ],
    );
  }

  Widget buildInfoCard(String title, String content) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
