#!/usr/bin/env sh

BASEDIR=$(dirname "$0")
happy -a "$BASEDIR/boot-src/Parser.ly" -o "$BASEDIR/src/Happy/Frontend/Parser.hs"
happy -a "$BASEDIR/boot-src/AttrGrammarParser.ly" -o "$BASEDIR/src/Happy/Frontend/AttrGrammar/Parser.hs"
