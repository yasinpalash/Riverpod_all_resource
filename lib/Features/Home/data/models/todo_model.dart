class TodoModel{


  final String id;
  final String title;
  final bool isDone;

  TodoModel({
    required this.id,
    required this.title,
    this.isDone= false,

});

  TodoModel copyWith({
    String? title,
    bool? isDone,

}){
    return TodoModel(
      id: id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

}