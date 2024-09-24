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

```



https://github.com/user-attachments/assets/24f580ee-b180-4f2f-bea7-3bf3b495fb6e









https://github.com/user-attachments/assets/dd396142-7520-4c33-b6fb-1da2b2b06c97








https://github.com/user-attachments/assets/32f4fd58-74c1-42a1-82a6-c90fe309752a



