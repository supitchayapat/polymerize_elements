@JS('PolymerElements')
library Polymer.NeonAnimationBehavior;
import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'package:polymer_element/polymer_element.dart';
import 'package:polymer_elements/iron_meta.dart' as imp0;

/**
 * 
 * Use `Polymer.NeonAnimationBehavior` to implement an animation.
 * 
 */

@BowerImport(ref:'PolymerElements/neon-animation#2.0-preview',import:"neon-animation/neon-animation-behavior.html",name:'neon-animation')
abstract class NeonAnimationBehavior  {
  /**
   * Defines the animation timing.
   */
   get animationTiming;
  set animationTiming( value);

}

