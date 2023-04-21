class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Wake up', isDone: true),
      ToDo(id: '02', todoText: 'Breath', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Sleep more than 4+',
      ),
      ToDo(
        id: '04',
        todoText: 'Drink water this time',
      ),
      ToDo(
        id: '05',
        todoText: 'Go eat for once',
      ),
      ToDo(
        id: '06',
        todoText: 'Stop Procrasinating',
      ),
    ];
  }
}
