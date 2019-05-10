import 'package:flutter/material.dart';
import 'dart:async';


void main() {
  //1.
//  runApp(HomeApp());
  /***
      //2.Future.delayed 延迟2s
      Future.delayed(new Duration(seconds: 2), () {
      //    return 'hello';
      throw AssertionError("Error");
      }).then((data) { //延时后操作
      //执行成功会走到这里
      print(data);
      }).catchError((e) { //异步错误
      //执行失败会走到这里
      print(e);
      }).whenComplete(() {
      //无论成功或者失败都会走到这里
      });

      //3.异步错误 ,then方法还有一个可选参数onError
      Future.delayed(new Duration(seconds: 2), () {
      return "滚";
      }).then((data) {
      print(data);
      }, onError: (e) {
      print(e);
      });
      //then((data){},onError:(b){});

      //4.异步多任务处理，全部结束执行操作
      Future.wait([
      Future.delayed(new Duration(seconds: 2), () { //2s后返回
      return 'Hello';
      }),
      Future.delayed(new Duration(seconds: 5), () { //3s后返回
      return "word";
      })
      ]).then((result) { //成功 hello word
      print(result[0] + result[1]);
      }).catchError((e) { //错误
      print(e);
      });

      //5.回调地狱
      //先分别定义各个异步任务
      Future login(String username, String pwd) {
      print('用户登录');
      };
      Future getUserInfo(String id) {
      print("获取用户信息");
      };
      Future saveUserInfo(String userInfo) {
      print("保存用户信息");
      }

      //  //执行任务流 ,回调太频繁了
      //  login('baipeng', '*****').then((id) {
      //    //登录成功后通过，id获取用户信息
      //    return getUserInfo(id);
      //  }).then((userInfo) {
      //    //获取用户信息后保存
      //    return saveUserInfo(userInfo);
      //  }).then((result) {
      //    //保存用户信息，接下来执行其它操作
      //  }).catchError((e) {
      //    //错误处理
      //    print(e);
      //  });

      //解除回调地狱，完解决
      task() async {
      try {
      String id = await login('baipeng', '******');
      String userInfo = await getUserInfo(id);
      await saveUserInfo(userInfo);
      //执行接下来操作

      } catch (e) {
      //错误
      print(e);
      }
      }
   ***/
  Stream.fromFutures([
    // 2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "hello 1";
    }),
    // 4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      throw AssertionError('Error');
    }),
    // 6秒后返回结果
    Future.delayed(new Duration(seconds: 6), () {
      return "hello 2";
    })
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print(e.message);
  }, onDone: () {
    print('done');
  });


  //1.使用flutter
  new Future(() {

  });
//  //异步函数
//  new Future((){
//    return futureTask();
//  }).then((m){
//      print("futueTask execute result:$m");
//  }).then((m){
//      print(m.length);
//  }).then((m){
//    return printLength(m);
//  }).whenComplete((){
//    whenTaskCompelete();
//  });


  // 异步任务的函数
  new Future(() => futureTask) //  异步任务的函数
      .then((m) => "futueTask execute result:$m") //   任务执行完后的子任务
      .then((m) => m.length) //  其中m为上个任务执行完后的返回的结果
      .then((m) => printLength(m))
      .whenComplete(() => whenTaskCompelete); //  当所有任务完成后的回调函数

  new Future.delayed(new Duration(seconds: 2), () => futureTask())
      .then((m) => "futureTask result: $m");


}

int futureTask() {
  return 21;
}

void printLength(int length) {
  print("Text Length:$length");
}

void whenTaskCompelete() {
  print("Task Complete");
}


class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
//      title: 'dart 语言',
      theme: ThemeData(primaryColor: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text('dart 语言'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('123'), Text('234'), Text('456')],
        ),
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ddd'),
      ),
    );
  }

}

void test() {
  var t;
  t = "hi world";
// 下面代码在dart中会报错，因为变量t的类型已经确定为String，
// 类型一旦确定后则不能再更改其类型。
  t = 1000;
}

bool isNoble(int atomicNumber) {
  return true;
}
//对于只包含一个表达式的函数，可以使用简写语法
//  bool isNoble （int atomicNumber ）=> _nobleGases [ atomicNumber ] ！= null ;

typedef bool CALLBACK();

//不指定返回类型，此时默认为dynamic，不是bool
//isNoble(int atomicNumber) {
//  return _nobleGases[atomicNumber] != null;
//}

void test1(CALLBACK cb) {
  print(cb());
}
//报错，isNoble不是bool类型
//test1(isNoble);

//函数作为变量 
var say = (str) {
  print(str);
};

//函数作为参数传递
void execute(var callback) {
  callback();
}

String saymessage(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void a() {
  saymessage('bod', 'hello');
  enableFlages();
}

//可选的命名参数
void enableFlages({bool bold, bool hidden}) {
  if (bold) {

  }
  if (hidden) {

  }
  //....
}



