(* main.sml *)

structure Lexer = MlbLex
structure Parser = MlbLrVals
structure Driver =
struct
  structure Lex = Lexer
  structure LrParser = MlbParser
  structure ParserData = LrParser.ParserData
  structure Stream = MlbStream

  fun parseFile filename =
    let
      val inStream = TextIO.openIn filename
      val lexer = Lex.makeLexer (fn () => TextIO.inputN (inStream, 1024))
      val result =
        (LrParser.parse (0, lexer, fn _ => (), ()))
        handle ex => (TextIO.closeIn inStream; raise ex)
    in
      TextIO.closeIn inStream;
      result
    end
end

val _ =
  (case Driver.parseFile "test_input.mlb" of
     result => print "Parsed successfully\n")

