main2(List<String> args) {
  testList();
}

/// 4. 集合类型
/// 4.1 List(数组)
void testList() {
    // 1. 定义
    var letters = ['a', 'b', 'c'];
    print('$letters, ${letters.runtimeType}');

    // 2. 明确指定类型
    List<int> numbers = [1, 2, 3, 4];
    print('$numbers ${numbers.runtimeType}');

    // 常用操作
    // 获取集合的长度
    int length = letters.length;

    // 添加/删除/包含
    numbers.add(5);
    numbers.remove(1);
    numbers.contains(2);

    // List根据index删除元素
    numbers.removeAt(2);
}

/// 4.2 Set
/// 其实，也就是把 [ ] 换成 { } 就好了。
/// Set 和 List 最大的两个不同就是：Set 是无序的，并且元素是不重复的。
void testSet() {
  // Set的定义
  // 1.使用类型推导定义
  var lettersSet = {'a', 'b', 'c', 'd'};
  print('$lettersSet ${lettersSet.runtimeType}');

  // 2.明确指定类型
  Set<int> numbersSet = {1, 2, 3, 4};
  print('$numbersSet ${numbersSet.runtimeType}');
}

void testMap() {
    // Map的定义
    // 1.使用类型推导定义
    var infoMap1 = {'name': 'why', 'age': 18};
    print('$infoMap1 ${infoMap1.runtimeType}');

    // 2.明确指定类型
    Map<String, Object> infoMap2 = {'height': 1.88, 'address': '北京市'};
    print('$infoMap2 ${infoMap2.runtimeType}');

    // 常用操作
    // 1.根据key获取value
    print(infoMap1['name']); // why

    // 2.获取所有的entries
    print('${infoMap1.entries} ${infoMap1.entries.runtimeType}'); 
    // (MapEntry(name: why), MapEntry(age: 18)) MappedIterable<String, MapEntry<String, Object>>

    // 3.获取所有的keys
    print('${infoMap1.keys} ${infoMap1.keys.runtimeType}'); // (name, age) _CompactIterable<String>

    // 4.获取所有的values
    print('${infoMap1.values} ${infoMap1.values.runtimeType}'); // (why, 18) _CompactIterable<Object>

    // 5.判断是否包含某个key或者value
    print('${infoMap1.containsKey('age')} ${infoMap1.containsValue(18)}'); // true true

    // 6.根据key删除元素
    infoMap1.remove('age');
    print('${infoMap1}'); // {name: why}
}

/// 3. 字符串类型
void test3() {
  // 1.定义字符串的方式
  var s1 = 'Hello World';
  var s2 = "Hello Dart";
  var s3 = 'Hello\'Fullter';
  var s4 = "Hello'Fullter";

  // 2.表示多行字符串的方式
  var message1 = '''
哈哈哈
呵呵呵
嘿嘿嘿''';
  print(message1);

  // 3.拼接其他变量
  var name = 'coderwhy';
  var age = 18;
  var height = 1.88;
  print('my name is ${name}, age is $age, height is $height');
}


main(List<String> args) {
    // 1.将函数赋值给一个变量
    // var bar = foo("哈哈");
    // print(bar);

    // 2.将函数作为另一个函数的参数
    // test(foo);

    // 3.将函数作为另一个函数的返回值
    var func = getFunc();
    func('kobe');
}

// 1.定义一个函数
foo(String name) {
  print('传入的name:$name');
}

// 2.将函数作为另外一个函数的参数
test(Function func) {
  func('coderwhy');
}

// 3.将函数作为另一个函数的返回值
getFunc() {
  return foo;
}


/// 2. 布尔类型
/// 没有非零即真

/// 1. 数字类型
void test1() {
  // 字符串和数字转化
  // 1. 字符串转数字
  var one = int.parse('111');
  var two = double.parse('12.22');
  print('${one} ${one.runtimeType}'); // 111 int
  print('${two} ${two.runtimeType}'); // 12.22 double

  // 2. 数字转字符串
  var num1 = 123;
  var num2 = 123.456;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
  print('${num1Str} ${num1Str.runtimeType}'); // 123 String
  print('${num2Str} ${num2Str.runtimeType}'); // 123.456 String
  print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46 String
}
