import 'dart:io';

class Clicker {
  late int _countClick;
  late int _clickToSound;
  late File _sound;
  late File _commonClickSound;

  Clicker(this._countClick, this._clickToSound, this._sound, this._commonClickSound);

  int get countClick => _countClick;
  int get clickToSound => _clickToSound;
  File get sound => _sound;
  File get commonClickSound => _commonClickSound;

  set countClick(int countClick) {
    if (countClick < 0) {
      throw ArgumentError("Click count cannot be negative");
    }
    _countClick = countClick;
  }

  set clickToSound(int clickToSound) {
    if (clickToSound <= 0) {
      throw ArgumentError("Click to sound threshold must be greater than zero");
    }
    _clickToSound = clickToSound;
  }

  set sound(File sound) {
    if (!sound.existsSync()) {
      throw ArgumentError("Sound file does not exist");
    }
    _sound = sound;
  }

  set commonClickSound(File commonClickSound) {
    if (!commonClickSound.existsSync()) {
      throw ArgumentError("Common click sound file does not exist");
    }
    _commonClickSound = commonClickSound;
  }

  File click() {
    _countClick++;
    if (_countClick % _clickToSound == 0) {
      return sound;
    } else {
      return commonClickSound;
    }
  }

}