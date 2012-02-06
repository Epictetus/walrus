/**
 * Walrus.js 0.1.1
 * Mon Feb 06 2012
 * (c) 2012 Jeremy Ruppel
 * Walrus.js is freely distributable under the terms of the MIT license.
 * https://raw.github.com/jeremyruppel/walrus/master/LICENSE
 */
(function() {
  var Walrus;

  Walrus = (typeof require !== "undefined" && require !== null) && (typeof exports !== "undefined" && exports !== null) ? require('./walrus') : window.Walrus;

  /**
   * *:squish*
   * Removes all leading and trailing whitespace, then condenses any internal whitespace
   * groups to a single space each.
   *
   * Parameters: none
   *
   * Usage:
   *
   *  {{ " foo    bar \n baz"  | :squish }} // => "foo bar baz"
  */

  Walrus.Filters.add('squish', function(string) {
    return string.replace(/^\s+|\s+$/g, '').replace(/\s+/g, ' ');
  });

  /**
   * *:truncate*
   * Truncates a string to the specified `length`, optionally breaking at a separator
   * or providing a custom string to denote an omission.
   *
   * Parameters:
   *  length (int) - the number of characters to keep, at most
   *  separator (string) - Optional: a specified string to break on
   *  omission (string) - Optional: a string to denote an omission
   *
   * Usage:
   *
   *  {{ "Once upon a time in a world far far away" | :truncate( 27, ' ' ) }} // => "Once upon a time in a..."
  */

  Walrus.Filters.add('truncate', function(string, length, separator, omission) {
    var chars, stop;
    if (separator == null) separator = false;
    if (omission == null) omission = '...';
    chars = length - omission.length;
    stop = separator ? string.lastIndexOf(separator, chars) || chars : chars;
    if (string.length > length) {
      return string.substr(0, stop) + omission;
    } else {
      return string;
    }
  });

}).call(this);
