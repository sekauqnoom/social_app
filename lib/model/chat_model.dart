class ChatModel {
  String avatar;
  String name;
  String lastMsg;
  String time;

  ChatModel(this.avatar, this.name, this.lastMsg, this.time);
}

class Messages{
  static List<ChatModel> mock(){
    List<ChatModel> _chatModels = [];
    _chatModels.add(ChatModel(
        "images/2.jpg",
        "杨帆",
        "在干什么呢",
        "21:22"));
    _chatModels.add(ChatModel(
        "images/15.jpg",
        "可心",
        "。。。",
        "20:12"));
    _chatModels.add(ChatModel(
        "images/5.jpg",
        "Sky",
        "再看吧",
        "14:20"));
    _chatModels.add(ChatModel(
        "images/11.jpg",
        "花花酱",
        "在干什么呢",
        "10:55"));
    _chatModels.add(ChatModel(
        "images/3.jpg",
        "敖雪",
        "来了吗",
        "09:09"));
    _chatModels.add(ChatModel(
        "images/4.jpg",
        "小郑",
        "昨天的事情解决了吗？",
        "昨天"));
//    _chatModels.add(ChatModel(
//        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXwwMnO760jdZUmWIcryDhNUL6iC-eA73kCKXRHbGfHXW_4_2",
//        "班级群",
//        "大家记得提交作业",
//        "昨天"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRQRNGE15zEjPG0iPMzszoSF15Gt1-P-BGQhLR9WXEnBhSPoU9c",
        "技术交流群",
        "flutter移动端第一",
        "昨天"));
    _chatModels.add(ChatModel(
        "images/8.jpg",
        "姐姐",
        "面试咋样啊",
        "前天"));
//    _chatModels.add(ChatModel(
//        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTQ66I7Z8V0nO5-pr4Ubd-HlM7WGJ78Mch-wszg1jx5UtOgeu7F",
//        "移动端群",
//        "flutter学习资料",
//        "前天"));
    _chatModels.add(ChatModel(
        "images/13.jpg",
        "哥哥",
        "哈哈哈哈哈哈",
        "前天"));
    _chatModels.add(ChatModel(
        "images/14.jpg",
        "唐希",
        "上课呢",
        "2020/02/29"));
//    _chatModels.add(ChatModel(
//        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcREk_qXU3ZmiiiKVXmMJbUsKLHLFwHzJPIQsTG5__Egp_wS2qqF",
//        "flutter 学习交流",
//        "大家好",
//        "2020/01/02"));
//    _chatModels.add(ChatModel(
//        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4hzXLbHh3WpNS2JPeDNGFrUxCy8G6q7ZhiEWch_rpsH-qjmlL",
//        "考研帮",
//        "考研看着",
//        "2010/01/02"));
//    _chatModels.add(ChatModel(
//        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSWhPmbTURlGR7Uw5eBPlXZnUEviQ6IPFOysANKNygCRMiGszFY",
//        "nike",
//        "悼念科比逝世",
//        "2010/01/02"));
//    _chatModels.add(ChatModel(
//        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRun_G8_dzpbZ4C8vcg1JgdUtwHsAdax_RJLTqjgAYWDPZ_r1or",
//        "建设银行",
//        "你的账户余额为xxx",
//        "2010/01/02"));
    _chatModels.add(ChatModel(
        "images/1.jpg",
        "JJ",
        "打球约吗",
        "2010/01/02"));
    return _chatModels;
  }
}