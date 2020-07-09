Colorcheck
=====
A Dart package exposing a Color class which can be used to create, convert, and compare colors.

Installation
-----
1. Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  colorcheck: any
```

1. Get the package using your IDE's GUI or via command line with

```bash
$ pub get
```

1. Import the `colorcheck.dart` file in your app

```dart
import 'package:colorcheck/colorcheck.dart';
```

Screenshots
-----
Here I am showing the how you can compare colors with the logs 

GIF  | Logs
------------- | -------------
<img src="https://user-images.githubusercontent.com/48018942/84833703-847d5c80-b04d-11ea-9ffb-b47a74a602b1.gif" heigth="550" width="330"/> | <img src="https://user-images.githubusercontent.com/48018942/84833700-834c2f80-b04d-11ea-8a61-84d0c76b0ef8.gif" heigth="800" width="700"/>

Usage
-----
Color objects can be check or compare using any of a few available constructors.

#### How it works
Baiscally, you have to give one color as input to get suggesions and you have to choose any button to change the colors as shown in GIF the new colord which appear on UI will be printed in logs so, you can pick from that 


initialy give some color input in `initState`

```dart
  @override
  void initState() {
    ColorCheck("#FDD148").init();
    super.initState();
  }
 ```

After choose any **button** to change color in on pressed of button use below code </br>
The input 3 in `colorCheck` function is the strenght(How much color variance you want), you can choose it from the scale of **1-10**   

```dart
onPressed: () {
  setState(() {
      changeColor(3);
      });
    },
 ```
so, from now whenever you pressed that button you will get the suggesions for similar colors. now apply the color to whatever widget you want, for example  I am choosing `BoxDecoration` so here I am applying `getCurrentColor()` to color field 

```dart
BoxDecoration(
          color: getCurrentColor(),
          borderRadius: BorderRadius.circular(50),
        )
```

you can apply to multipule widget also

</br>

### Random color

You can get the color if you didn't like any colors so you can choose one from it

### Usage

Here you don't need to initialize anything, stright away choose any button to change the color. in onPressed add the below method

```dart
 onPressed: () {
            setState(() {
              getRandomColor();
            });
          },
```

From here you can get the random colors, you have to apply them to widgets

```dart
BoxDecoration(
          color: getRandomColor(),
          borderRadius: BorderRadius.circular(50),
        )
```

</br>

Thanks for Viewing and using, Happy coding :)
Feel free to contact me
