Walrus = require '../lib/walrus'

describe 'Walrus.Parser', ->

  it 'should be defined', -> expect( Walrus.Parser ).toBeDefined( )

  describe '#parse', ->

    it 'should be defined', -> expect( Walrus.Parser.parse ).toBeDefined( )

    fs    = require 'fs'
    path  = require 'path'
    specs = './spec/examples'

    Walrus.Parser.parser.yy = Walrus.AST

    for file in fs.readdirSync specs when path.extname( file ) is '.wal'

      do ( file ) ->

        base = path.basename file, '.wal'

        text = fs.readFileSync "#{specs}/#{base}.wal",  'utf8'
        json = fs.readFileSync "#{specs}/#{base}.js",   'utf8'
        html = fs.readFileSync "#{specs}/#{base}.html", 'utf8'

        tmpl = Walrus.Parser.parse text

        console.log '*****'
        console.log file
        console.log tmpl
        console.log eval( "(#{json})" )
        console.log tmpl.compile( eval( "(#{json})" ) )

        it "should pass the #{base} example", -> expect( tmpl.compile eval( "(#{json})" ) ).toEqual html
