@JS('PolymerElements')
library Polymer.AppScrollEffectsBehavior;
import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'package:polymer_element/polymer_element.dart';
import 'package:polymer_elements/iron_scroll_target_behavior.dart' as imp0;

/**
 * 
 * `Polymer.AppScrollEffectsBehavior` provides an interface that allows an element to use scrolls effects.
 * ### Importing the app-layout effects
 * app-layout provides a set of scroll effects that can be used by explicitly importing
 * `app-scroll-effects.html`:
 * ```html
 * <link rel="import" href="/bower_components/app-layout/app-scroll-effects/app-scroll-effects.html">
 * ```
 * The scroll effects can also be used by individually importing
 * `app-layout/app-scroll-effects/effects/[effectName].html`. For example:
 * ```html
 *  <link rel="import" href="/bower_components/app-layout/app-scroll-effects/effects/waterfall.html">
 * ```
 * ### Consuming effects
 * Effects can be consumed via the `effects` property. For example:
 * ```html
 * <app-header effects="waterfall"></app-header>
 * ```
 * ### Creating scroll effects
 * You may want to create a custom scroll effect if you need to modify the CSS of an element
 * based on the scroll position.
 * A scroll effect definition is an object with `setUp()`, `tearDown()` and `run()` functions.
 * To register the effect, you can use `Polymer.AppLayout.registerEffect(effectName, effectDef)`
 * For example, let's define an effect that resizes the header's logo:
 * ```js
 * Polymer.AppLayout.registerEffect('resizable-logo', {
 *   setUp: function(config) {
 *     // the effect's config is passed to the setUp.
 *     this._fxResizeLogo = { logo: Polymer.dom(this).querySelector('[logo]') };
 *   },
 *   run: function(progress) {
 *      // the progress of the effect
 *      this.transform('scale3d(' + progress + ', '+ progress +', 1)',  this._fxResizeLogo.logo);
 *   },
 *   tearDown: function() {
 *      // clean up and reset of states
 *      delete this._fxResizeLogo;
 *   }
 * });
 * ```
 * Now, you can consume the effect:
 * ```html
 * <app-header id="appHeader" effects="resizable-logo">
 *   <img logo src="logo.svg">
 * </app-header>
 * ```
 * ### Imperative API
 * ```js
 * var logoEffect = appHeader.createEffect('resizable-logo', effectConfig);
 * // run the effect: logoEffect.run(progress);
 * // tear down the effect: logoEffect.tearDown();
 * ```
 * ### Configuring effects
 * For effects installed via the `effects` property, their configuration can be set
 * via the `effectsConfig` property. For example:
 * ```html
 * <app-header effects="waterfall"
 *   effects-config='{"waterfall": {"startsAt": 0, "endsAt": 0.5}}'>
 * </app-header>
 * ```
 * All effects have a `startsAt` and `endsAt` config property. They specify at what
 * point the effect should start and end. This value goes from 0 to 1 inclusive.
 * 
 */

@BowerImport(ref:'PolymerElements/app-layout#2.0-preview',import:"app-layout/app-scroll-effects/app-scroll-effects-behavior.html",name:'app-layout')
abstract class AppScrollEffectsBehavior implements imp0.IronScrollTargetBehavior {
  /**
   * A space-separated list of the effects names that will be triggered when the user scrolls.
   * e.g. `waterfall parallax-background` installs the `waterfall` and `parallax-background`.
   */
  String get effects;
  set effects(String value);

  /**
   * An object that configurates the effects installed via the `effects` property. e.g.
   * ```js
   *  element.effectsConfig = {
   *   "blend-background": {
   *     "startsAt": 0.5
   *   }
   * };
   * ```
   * Every effect has at least two config properties: `startsAt` and `endsAt`.
   * These properties indicate when the event should start and end respectively
   * and relative to the overall element progress. So for example, if `blend-background`
   * starts at `0.5`, the effect will only start once the current element reaches 0.5
   * of its progress. In this context, the progress is a value in the range of `[0, 1]`
   * that indicates where this element is on the screen relative to the viewport.
   */
   get effectsConfig;
  set effectsConfig( value);

  /**
   * Disables CSS transitions and scroll effects on the element.
   */
  bool get disabled;
  set disabled(bool value);

  /**
   * Allows to set a `scrollTop` threshold. When greater than 0, `thresholdTriggered`
   * is true only when the scroll target's `scrollTop` has reached this value.
   * For example, if `threshold = 100`, `thresholdTriggered` is true when the `scrollTop`
   * is at least `100`.
   */
  num get threshold;
  set threshold(num value);

  /**
   * True if the `scrollTop` threshold (set in `scrollTopThreshold`) has
   * been reached.
   */
  bool get thresholdTriggered;
  set thresholdTriggered(bool value);

}

