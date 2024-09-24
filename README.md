# Teeth_anatomy

Dental anatomy display package

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  teeth_anatomy: <latest_version>
```

## Usage

```dart
import 'package:teeth_anatomy/teeth_custom_paint.dart';


class MyApp extends Stateless {


  Widget build(BuildContext context) {
    return TeethWidget(
      borderWith: 1,
      size: 500,
      textPaddingLeft: -10,
      textPaddingTop: 1,
      selectedColor: Colors.purpleAccent,
      unSelectedColor: Colors.white,
      borderColor: Colors.green,
      textStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
      onTap: (String id, selected) {
        if (selected) {
          tooth.add(TeethModel(
              id: id,
              selectedColor: Colors.primaries[Random().nextInt(16)]));
        } else {
          tooth.removeWhere((r) => r.id == id);
        }

        setState(() {});
      },
      teeth: tooth,
    );
  }

}




https://github.com/user-attachments/assets/d41335b7-d3c8-4c37-8d36-3f9acdbff7f0




```


