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
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQiH3mCzekL-nfaUlyUGZgNYZUrw6hZ16t94cAfbUMKwSYn2W3P",
        "biao",
        "在干什么呢",
        "21:22"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS4JMNLEU2hiDy8Ex5xG50ANgHZreOetVwNJKRqWiYrYJOm7mIr",
        "花花酱",
        "在干什么呢",
        "10:55"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTiLwxp7JZwSWKzBH-bMufQqrhFJo8mFW93femb-Tc4oIxxRDqt",
        "赵四",
        "昨天的事情解决了吗？",
        "昨天"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQmXTcoRf6Iamd-VqKxYq_9OQaznMDt7gaR0NIooO56wFSm2syT",
        "哥哥",
        "哈哈",
        "前天"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQgdRIcVlZhKfaIxLwK6uISA449_Xy12X7P5qoDhTu8Yv61YLfx",
        "好的名字让朋友记住你",
        "。。。",
        "20:12"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTG5_BNUtecugKy-_nc1CpAsV_px4MReS4qGED-1jY5UnjnTgcj",
        "。。。",
        "来了吗",
        "09:09"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQs4Q6FnVBC2xzmzmryFs1pKkHZ8e2gOoRsE3UjLTme_jzF3mas",
        "Cling",
        "上课呢",
        "2020/02/29"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3HsH3q2LkXh_abUc_T7Nx-iNkCgRUus4yr8givvbvpah05X43",
        "Sky",
        "再看吧",
        "14:20"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTaXwwMnO760jdZUmWIcryDhNUL6iC-eA73kCKXRHbGfHXW_4_2",
        "班级群",
        "大家记得提交作业",
        "昨天"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRQRNGE15zEjPG0iPMzszoSF15Gt1-P-BGQhLR9WXEnBhSPoU9c",
        "技术交流群",
        "flutter移动端第一",
        "昨天"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTXLMYnpb-PMV0wPYf9L5kPJzgjSXvIfdJhhbQdLLlLieq8m5zA",
        "java工程师王一",
        "面试咋样啊",
        "前天"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTQ66I7Z8V0nO5-pr4Ubd-HlM7WGJ78Mch-wszg1jx5UtOgeu7F",
        "移动端群",
        "flutter学习资料",
        "前天"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcREk_qXU3ZmiiiKVXmMJbUsKLHLFwHzJPIQsTG5__Egp_wS2qqF",
        "flutter 学习交流",
        "大家好",
        "2020/01/02"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT4hzXLbHh3WpNS2JPeDNGFrUxCy8G6q7ZhiEWch_rpsH-qjmlL",
        "考研帮",
        "考研看着",
        "2010/01/02"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSWhPmbTURlGR7Uw5eBPlXZnUEviQ6IPFOysANKNygCRMiGszFY",
        "nike",
        "悼念科比逝世",
        "2010/01/02"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRun_G8_dzpbZ4C8vcg1JgdUtwHsAdax_RJLTqjgAYWDPZ_r1or",
        "建设银行",
        "你的账户余额为xxx",
        "2010/01/02"));
    _chatModels.add(ChatModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvhH1fNTnBRdIxFGWU7UtsYUfZME5rAQOBM2LMmqEKqxyIyK5t",
        "徐蒙多",
        "打球约吗",
        "2010/01/02"));
    return _chatModels;
  }
}