// 数据实体
class Resource{
  final String title;
  final String resourceUrl;
  final String description;

  Resource(this.title,this.resourceUrl,this.description);
}

final List<Resource> pdf_search_site = [
  Resource("鸠摩搜书", "https://www.jiumodiary.com/", "免费提供pdf电子书的网站"),
  Resource("脚本之家", "https://www.jb51.net/books/", "提供较多电子书，并且提供多种下载方式"),
//    Resource(),
];
final List<Resource> learning_video_site = [
  Resource("哔哩哔哩", "https://www.bilibili.com/", "提供海量优质学习教程视频"),
  Resource("慕课网", "https://www.imooc.com/", "提供海量基础入门视频"),
  Resource("网易云课堂", "https://study.163.com/", "提供海量基础入门视频"),
  Resource("中国大学MOOC", "https://www.icourse163.org/", "提供各大高校教学视频")
];
final List<Resource> no_video_learning_site = [
  Resource("菜鸟教程", "https://www.runoob.com/", "多种入门教程，并且提供多种在线运行环境"),
  Resource("W3Schools", "https://www.w3schools.com/", "提供较多电子书，并且提供多种下载方式"),
//    Resource(),
];


