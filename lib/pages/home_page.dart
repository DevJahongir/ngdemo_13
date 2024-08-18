import 'package:flutter/material.dart';
import 'package:ngdemo_13/services/log_service.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Post> posts = [];

  String text = 'no name';

  _apiPostList() async {
    var response =
        await Network.GET(Network.API_POST_LIST, Network.paramsEmpty());
    LogService.d(response!);
    setState(() {
      text = response;
    });
  }


  _apiCreatePost() async {
    Post post =  Post(title: "Nextgen1", body: "Academy1", userId: 103);
     var response = await Network.POST(Network.API_POST_CREATE, Network.paramsCreate(post));
    LogService.i(response!);
    setState(() {
      text = response;
    });
  }


  _apiUpdatePost() async {
    Post post =  Post(id: 100, title: "Nextgen", body: "Academy", userId: 102);
    var response = await Network.PUT(Network.API_POST_UPDATE+post.id.toString(), Network.paramsUpdate(post));
    LogService.i(response!);
    setState(() {
      text = response!;
    });
  }


  _apiDeletePost() async {
    Post post =  Post(id: 100, title: "Nextgen", body: "Academy", userId: 102);
    var response =
    await Network.DEL(Network.API_POST_DELETE+post.id.toString(), Network.paramsEmpty());
    LogService.d(response!);
    setState(() {
      text = response;
    });
  }

  @override
  void initState() {
    super.initState();
    _apiCreatePost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post API', style: TextStyle(fontSize: 20),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
