import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// 数据实体
class News{
  final String title;
  final String newsUrl;
  final String description;
  final String time;

  News({this.title,this.newsUrl,this.description,this.time});
}

List<News> data = [];

// 构造请求头
var header = {
  'user-agent' : 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) '+
      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',
};

// 数据的请求
request_data() async{
  var url = "https://news.uestc.edu.cn/?n=UestcNews.Front.Category.Page&CatId=50";

  var response = await http.get(url,headers: header);
  if (response.statusCode == 200) {
    return response.body;
  }
  return '<html>error! status:${response.statusCode}</html>';
}

// 数据的解析
html_parse() async{
  var url = "https://news.uestc.edu.cn";
  var html = await request_data();
  Document document = parse(html);
  // 这里使用css选择器语法提取数据
  List<Element> newsList1 = document.querySelectorAll('#Degas_news_list >  ul >  li > h3 > a');
  List<Element> newsList2 = document.querySelectorAll('.desc');
  List<Element> newsList3 = document.querySelectorAll('.time');

  if(newsList1.isNotEmpty && newsList2.isNotEmpty &&newsList3.isNotEmpty){
    data = List.generate(newsList1.length, (i){
      return News(
          title: newsList1[i].text.trim(),      //.replaceAll(RegExp(r"\s+\b|\b\s"),""),
          newsUrl: url+newsList1[i].attributes['href'],
          description: newsList2[i].text.trim(),
          time:  newsList3[i].text.trim()
      );
    });
  }
  return data;
}
//
//void print_data() async{
//  var data = await html_parse();
//  for(int i=0; i<5;i++){
//    print(data[i].title);
//    print(data[i].newsUrl);
//  }
//}

//// 数据的储存
//void save_data() async{
//  var data = await html_parse();
//  var json_str = json.encode({'items':data});
//
//  String tempPath = (await getApplicationDocumentsDirectory()).path;
//
//  // 将json写入文件中
//  await File(tempPath+'/data.json').writeAsString(json_str,flush: true);
//  var contents = await File(tempPath+'/data.json').readAsString();
//  print(contents);
//}

