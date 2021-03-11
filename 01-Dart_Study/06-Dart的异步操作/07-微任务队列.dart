import 'dart:async';

main(List<String> args) {
  print("main start");

  Future(() => print("task1"));
	
  // 只要有创建Future对象, 就会根据Future创建的顺序加入到事件队列中
  final future = Future(() => null);

  Future(() => print("task2")).then((_) {
    print("task3");
    scheduleMicrotask(() => print('task4'));
  }).then((_) => print("task5"));

  future.then((_) => print("task6"));
  scheduleMicrotask(() => print('task7'));

  Future(() => print('task8'))
    .then((_) => Future(() => print('task9')))
    .then((_) => print('task10'));

  print("main end");
}

void test() {

  Future(() => print('future #2 of 4'))
  .then((_) => print('future #2a'))
  .then((_) {
    print('future #2b');
    scheduleMicrotask(() => print('microtask #0 (from future #2b)'));
  }).then((_) => print('future #2c'));

  Future(() => print('future #3 of 4'))
  .then((_) => Future(
    () => print('future #3a (a new future)')))
    .then((_) => print('future #3b'));
}