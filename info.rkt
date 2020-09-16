#lang info
(define collection 'multi)
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/net-pem.scrbl" ())))
(define pkg-desc "Implements a parser for RFC7468 (PEM) files")
(define version "0.1")
(define pkg-authors '(themetaschemer))
(define compile-omit-paths '("net/pem/tests"))
