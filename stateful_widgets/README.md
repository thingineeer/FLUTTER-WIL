# Stateful Widgets

Stateless Widget 은 build 메서드를 통해 단지 UI를 출력하는 위젯임

`Stateful Widget` 은 상태를 가지고 있어서 `Stateful` 이라고 부릅니다.

즉 상태에 따라 실시간으로 변하게 될 데이터를 생각하면 됩니다.

위젯이 데이터를 저장하고 싶고 실시간으로 데이터의 변화를 보고 싶으면 `Stateful` 이다.

Stateful Widget은 두가지로 나눠진다.

1. 상태가 없는 위젯 그 자체 : 매우 작은 부분
2. 위젯의 상태로 위젯의 State는 위젯에 들어갈 데이터와 UI를 넣는 곳임
    1. 핵심은 데이터가 변경되면 해당 위젯의 UI도 변경된다는 점이다.

`StatelessWidget` 을 코드 액션을 통해 statefulWidget 으로 바꿔준다면

위 처럼 두개의 파트로 변경된다.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget { // 매우 작은 부분 , 위젯 그자체임
  @override
  State<MyApp> createState() => _MyAppState();
}

// state는 우리가 UI를 구축하는 곳이고 이 상태는 매우 특별하다.
// 왜냐 하면 우리가 State의 데이터를 바꿀 때 우리의 UI는 새로고침 되면서 최신 데이터를 보여줌
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Container(
          
        ),
      ),
    );
  }
}
```
<br>
<br>

## Counter 구현

counter는 바뀔 값이니 final로 선언 x

버튼을 누르면 counter가 증가하듯이 구현할 것이다.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int counter = 0; // 카운터 선언

  void onClicked() {
    setState(() {
      counter += 1;
    });
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$counter',
                style: TextStyle(fontSize: 30),
              ),
              IconButton(onPressed: onClicked, icon: Icon(Icons.add_box_rounded)),
              IconButton(onPressed: reset, icon: Icon(Icons.lock_reset_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
```

⭐️`setState(() {});`

State 클래스 에게 데이터가 변경되었다고 알리는 함수이다. (bulid 메서드 재실행)

함수 내에 원하는 코드를 넣어도 되고, 코드를 먼저 사용하고 이후에 선언해도 상관없다.

다만 가독성을 위해 setState() 함수 내부에 넣는 것을 권장함

```dart
  int counter = 0;

  void onClicked() {
    setState(() {
      counter += 1;
    });
  }

  void reset() {
    counter = 0;
    setState(() {});
  }
```
<p align="left">
<img src = "https://github.com/thingineeer/FLUTTER-WIL/assets/88179341/ce5532d9-8326-490c-b7af-b12912854ecd" width="35%" height="35%" >
</p>

---

# Widget build(BuildContext context)

여기서 `BuildContext context` 이게 의미하는 게 뭘까?

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  'My Large Title',
              style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

저기서 MyLargeTitle 부분을 위젯으로 추출 (⌘+⌥+W) in Android Studio

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget { // 따로 위젯으로 분리
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        'My Large Title',
    style: TextStyle(fontSize: 30),
    );
  }
}
```

MyAppState 안에 있는 위젯에서 MyLargeTitle 을 별도의 위젯으로 분리했다.

MaterialApp 안의 theme을 사용해서 텍스트 속성을 조정할 것이다.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          )
        )
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        'My Large Title',
    style: TextStyle(fontSize: 30),
    );
  }
}
```

`BulidContext` 에 대해 알아보자

`theme`을 만들었다. `theme`은 MyApp 위젯의 state에 있다.

그리고 MyApp 위젯의 state는 MyLargeTitle이라는 자식을 가지고 있음

MyLargeTitle 은 맨 아래에 StatelessWidget이고 분리되었다. (다른 클래스)

우리가 할 것은 `theme`에 접근하는 것!

StatelessWidget 인 MyLargeTitle 에서 `theme` 값에 접근하는 것을 원한다.

이 말은 MyLargeTitle에서 부모 요소와 대화할 수 있기를 원한 다는 것이고

부모는 바로 _MyAppState이다.

왜냐하면 부모 요소는 titleLarge의 색깔이 뭔지 알고 있기 때문이다.

직접 접근하기 위해 `BulidContext` 를 이용해야한다.

이걸 알기 위해서는 위젯트리를 이해해야함

<br>

<img width="428" alt="image" src="https://github.com/thingineeer/FLUTTER-WIL/assets/88179341/b8b88561-be01-4414-8ccc-aea7e0e982ed">


이 부분이 Flutter가 App을 어떻게 렌더링 하는지 보여주는 그림

Container 부분이 Root이고 우리 코드에서는 MyApp() 을 의미

App클래스는 보다시피 수많은 자식 요소를 가지고   

현재 앱의 구조를 보면 

<img width="337" alt="image" src="https://github.com/thingineeer/FLUTTER-WIL/assets/88179341/f85b92b6-f019-4ba5-994d-2fbcb31905f7">


<br>

이렇게 구성되어 있다.

우리가 하고 싶은 것은 MyLargeTitle이 부모 요소 정보에 접근하는 것임

context를 이용해서 접근해야 함

`context : Text 이전에 있는 모든 상위 요소들에 대한 정보`

context에는 위젯 트리에 대한 정보가 담겨있고, 매우 먼 요소의 데이터를 가져올 수 있기 때문에 유용하다.

단순히 부모 요소 말고 그 요소의 부모 요소 그 위에…까지 다 가지고 있음

이게 context가 하는 일이다.

실제로는 이것보다 좀 더 복잡하다.

하지만 이건 너의 부모 요소에 접근할 수 있게 해줘

또한 앱 안에서 너의 위젯의 위치에 대한 정보를 알려줌!

BuildContext를 사용해서 우리가 어떤 위젯이고 누가 우리의 부모 요소인 알 수 있고 부모의 부모.. 쭉 위까지 접근 가능

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              titleLarge: TextStyle(
        color: Colors.red,
      ))),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
```

`color: Theme.of(context).textTheme.titleLarge?.color,`

이 부분에서 context 접근을 통해 theme에 접근하여 속성 추가

Dart는 null safe 언어이기 때문에 null 값에 접근할 수 있는 경우들을 방지하기 원함

이 경우에서는 Dart는 우리가 titleLarge, color, red를 설정했는지 알 수 없다.

우리가 해줄 것은 color가 존재한다는 것을 `!` 를 사용해서 명확히 해줘야 함

또는 그것이 있는 경우 사용하라고 `?` 키워드로 말할 수도 있다.

`Stateful widget` 은 Live 하다

위젯에게 일어나는 LifeCycle을 가지고 있다.

이벤트에 반응한다.

`MyLargeTitle` 클래스를 코드액션을 통해 StatefulWidget 위젯으로 변경하면 아래와 같이 된다.

```dart
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
```

StatefulWidget은 bulid 메서드 이외에 무엇을 가지고 있을까?

<br>
<br>

## initState

`initState` 도 가지고 있는데 이는 상태를 초기화하기 위한 메서드이다.

대부분의 경우 클래스 안에 상태변수를 초기화할 수 있는데,

하지만 종종 부모 요소에 의존하는 데이터를 초기화해야 하는 경우에는 사용함

가끔 데이터를 초기화 하기 위해 사용하거나 API에서 업데이트 하는 경우에 context 를 사용하게 된다.

⭐️중요한 점은 initState 메서드가 항상 bulid 메서드 보다 먼저 호출 되야한다.⭐️

그리고 initState 메서드는 오직 단 한번만 호출 된다.

우리가 initState 메서드를 사용할 때  super.initState(); 를 호출해야한다.

<br>
<br>

## dispose

위젯이 스크린에서 제거될 때 호출되는 메서드(사라질 때)

마찬가지고 API 업데이트나, 구독 취소 같은 이벤트 이다.

위젯이 위젯 트리에서 제거되기 전에 무언가를 취소하고 싶을 때 사용

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showTitle = true;

  void ToggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              titleLarge: TextStyle(
        color: Colors.red,
      ))),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? MyLargeTitle() : Text('빈 문자열'),
              IconButton(
                  onPressed: ToggleTitle, icon: Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('⭐️initState !');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('❌dispose !');
  }

  @override
  Widget build(BuildContext context) {
    print('🔥build !');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
```

![디버깅](https://github.com/thingineeer/FLUTTER-WIL/assets/88179341/3e7ea7e7-c548-48d9-9bbf-9171510a46a3)

