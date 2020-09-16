#lang scribble/manual
@require[@for-label["../net/pem/pem.rkt"
                    racket/base]]

@title{Privacy Enhanced Mail (PEM) Parsing and Unparsing}
@author{Anurag Mendhekar}

This is a library for parsing and unparsing @link["https://tools.ietf.org/html/rfc7468"]{Privacy Enhanced Mail (PEM) (RFC7468)} strings. This is useful to parse things like certificates, private keys etc. which are typically encoded as PEM files.
For example,
@verbatim{
-----BEGIN ENCRYPTED PRIVATE KEY-----
MIHNMEAGCSqGSIb3DQEFDTAzMBsGCSqGSIb3DQEFDDAOBAghhICA6T/51QICCAAw
FAYIKoZIhvcNAwcECBCxDgvI59i9BIGIY3CAqlMNBgaSI5QiiWVNJ3IpfLnEiEsW
Z0JIoHyRmKK/+cr9QPLnzxImm0TR9s4JrG3CilzTWvb0jIvbG3hu0zyFPraoMkap
8eRzWsIvC5SVel+CSjoS2mVS87cyjlD+txrmrXOVYDE+eTgMLbrLmsWh3QkCTRtF
QC7k0NNzUHTV9yGDwfqMbw==
-----END ENCRYPTED PRIVATE KEY-----
}

We refer to these strings as PEM string. Here, @code{"ENCRYPTED PRIVATE KEY"} is the @code{label}. The
lines between the @code{"-----BEGIN"} and @code{"-----END"} lines
are base64 encoded and referred to herein as the @code{body-lines}.

To install,
@verbatim{
> raco pkg install net-pem
}

@defmodule[net/pem #:packages ("base")]

@defproc[(pem? [v any/c]) boolean?]
Returns @code{#t} if @code{v} is a parsed PEM object. 

@defproc[(pem-label [p pem?]) string?]
Returns the label associated with the parse PEM object.

@defproc[(pem-body [p pem?]) bytes?]
Returns the body of the PEM object. 

@defproc[(pem-string->pem [ps string?]) pem?]
Parses a string in the PEM (RFC7468) format and returns the @code{pem} which
contains the label of contained in the PEM string, and the base64 decoded
@code{body-lines} in the PEM string.

@defproc[(pem->pem-string [p pem?]) string?]
Converts @code{p} into a PEM string. 

