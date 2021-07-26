import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeson_app/src/controllers/apiController.dart';

class HomePage extends StatelessWidget {
  final _apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    _apiController.getNews();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          'News App',
        ),
        backgroundColor: Colors.green[600],
      ),
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => Center(
            child: _apiController.news.isEmpty
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: _apiController.news['articles'].length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = _apiController.news['articles'][index];
                          return Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                // Card(
                                //   child: item['urlToImage'] == null
                                //       ? Text('No image')
                                //       : Image.network(item['urlToImage']),
                                // ),
                                Card(
                                  child: item['urlToImage'] == null
                                      ? Image.network(
                                          'https://picsum.photos/250?image=9')
                                      : Image.network(item['urlToImage']),
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${item["title"]}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('${item["author"]}'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('${item['source']['name']}'),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('${item["description"]}'),
                                SizedBox(
                                  height: 7,
                                ),
                                Text('${item["content"]}'),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
