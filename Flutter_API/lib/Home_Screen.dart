import 'package:education_app/Services/get_services.dart';
import 'package:flutter/material.dart';

import 'Model/get_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommandsModel> commendsModel = [];

  getComments() {
    GetApiServices().getCommentsModel().then((value) {
      setState(() {
        commendsModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 239, 239),
        title: Text(
          "GET API",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: commendsModel.length,
        itemBuilder: (context, index) {
          final apidata = commendsModel[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.blue[100],
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Row(
                children: [
                  SizedBox(
                    width: 3,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Text(
                      apidata.id.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    width: 5.5,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apidata.name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text(
                            apidata.email.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text(
                            apidata.body.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
