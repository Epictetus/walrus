Walrus = require '../bin/walrus'
should = require 'should'

require '../bin/walrus.inflections'

describe 'walrus.inflections', ->

  fs    = require 'fs'
  path  = require 'path'
  specs = './test/examples/inflections'

  for file in fs.readdirSync specs when path.extname( file ) is '.wal'

    do ( file ) ->

      base = path.basename file, '.wal'

      text = fs.readFileSync "#{specs}/#{base}.wal",  'utf8'
      json = fs.readFileSync "#{specs}/#{base}.js",   'utf8'
      html = fs.readFileSync "#{specs}/#{base}.html", 'utf8'

      tmpl = Walrus.Parser.parse text

      it "should pass the #{base} example", -> tmpl.compile( eval( "(#{json})" ) ).should.equal html
