@JS('PolymerElements')
library Polymer.PaperSpinnerBehavior;
import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'package:polymer_element/polymer_element.dart';


/**
 * 
 */

@BowerImport(ref:'PolymerElements/paper-spinner#2.0-preview',import:"paper-spinner/paper-spinner-behavior.html",name:'paper-spinner')
abstract class PaperSpinnerBehavior  {
  /**
   * Displays the spinner.
   */
  bool get active;
  set active(bool value);

  /**
   * Alternative text content for accessibility support.
   * If alt is present, it will add an aria-label whose content matches alt when active.
   * If alt is not present, it will default to 'loading' as the alt value.
   */
  String get alt;
  set alt(String value);

}

