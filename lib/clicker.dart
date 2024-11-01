import 'dart:io';

class Clicker{
  late int countClick;
  late int clickToSound;
  late File sound;
  late File commonClickSound;
  Clicker(int countClick, int clickToSound, File sound, File commonClickSound){
    this.countClick = countClick;
    this.clickToSound = clickToSound;
    this.sound = sound;
    this.commonClickSound = commonClickSound;
  }
  
  File click(){
    countClick++;
    if (countClick % clickToSound == 0)
      return getSound();
    else
      return getCommonClickSound();
  }

  File getSound(){
      return sound;
  }

  File getCommonClickSound(){
    return commonClickSound;
  }
}