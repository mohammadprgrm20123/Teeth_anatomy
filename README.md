# Teeth_anatomy

Dental anatomy display package

## Installation

https://github.com/user-attachments/assets/e7265a1a-0ce9-4acd-9fa8-c610df3760d3
https://github.com/user-attachments/assets/eff90594-028f-4879-9199-7d6cbf7a6c69
https://github.com/user-attachments/assets/6ae53d50-ea29-47d8-85cc-aa7249993c52




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





```


