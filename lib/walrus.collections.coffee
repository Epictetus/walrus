Walrus = if require? and exports? then require './walrus' else window.Walrus

Walrus.Filters.add 'first', ( array, count ) ->

  if count? then array.slice 0, count else array[ 0 ]
