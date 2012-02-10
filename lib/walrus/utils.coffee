Utils =
  ###*
   * trims leading and trailing whitespace
  ###
  trim : ( str ) -> str.replace /^\s+|\s+$/g, ''

  ###*
   * reduces a list into a single result
  ###
  reduce : ( array, initial, method ) ->

    memo = initial
    memo = method memo, item for item in array
    memo

  ###*
   * returns the string representation of `foo`
  ###
  toString : ( foo ) -> Object.prototype.toString.call foo

  ###*
   * returns whether or not `foo` is an array
  ###
  isArray : ( foo ) -> @toString( foo ) is '[object Array]'

  ###*
   * applies all properties from `bar` onto `foo`
  ###
  extend : ( foo, bar ) -> foo[ key ] = value for key, value of bar

  ###*
   * all of the nasty html characters to escape
  ###
  escapees : /[&'"<>]/g
  escapes :
    '&' : '&amp;'
    "'" : '&#x27;'
    '"' : '&quot;'
    '<' : '&lt;'
    '>' : '&rt;'

  ###*
   * escapes nasty html characters
  ###
  escape : ( string ) -> string.replace @escapees, ( c ) => @escapes[ c ] || c

# Export those utils, son.
Walrus.Utils = Utils
