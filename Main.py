import sys
from antlr4 import *
from gen.MiniJavaLexer import MiniJavaLexer
from gen.MiniJavaParser import MiniJavaParser

def main(argv):
    incode = FileStream(argv[1])
    lexer = MiniJavaLexer(incode)
    stream = CommonTokenStream(lexer)
    parser = MiniJavaParser(stream)

if __name__ == '__main__':
    main(sys.argv)
