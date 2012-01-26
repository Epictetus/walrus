Walrus = require '../bin/walrus'

require '../bin/walrus.collections'

describe 'walrus.collections', ->

  fs    = require 'fs'
  path  = require 'path'
  specs = './spec/examples/collections'

  for file in fs.readdirSync specs when path.extname( file ) is '.wal'

    do ( file ) ->

      base = path.basename file, '.wal'

      text = fs.readFileSync "#{specs}/#{base}.wal",  'utf8'
      json = fs.readFileSync "#{specs}/#{base}.js",   'utf8'
      html = fs.readFileSync "#{specs}/#{base}.html", 'utf8'

      tmpl = Walrus.Parser.parse text

      it "should pass the #{base} example", -> expect( tmpl.compile eval( "(#{json})" ) ).toEqual html
