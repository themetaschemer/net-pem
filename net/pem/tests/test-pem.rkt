(module+ test
  (require rackunit)

  (check-equal?
   (regexp-match (pregexp labelchar) "A")
   '("A"))

  (check-false
   (regexp-match (pregexp labelchar) ""))

  (check-equal?
   (regexp-match (pregexp base64pad) "=")
   '("="))

  (check-false
   (regexp-match (pregexp base64pad) "88"))

  (check-equal?
   (regexp-match (pregexp base64char) "A")
   '("A"))

  (check-equal?
   (regexp-match (pregexp base64char) "0")
   '("0"))

  (check-equal?
   (regexp-match (pregexp base64char) "+")
   '("+"))

  (check-equal?
   (regexp-match (pregexp base64char) "/")
   '("/"))

  (check-false
   (regexp-match (pregexp base64char) "!"))

  (check-equal?
   (regexp-match (pregexp eol) "\r")
   '("\r" "\r"))

  (check-equal?
   (regexp-match (pregexp eol) "\n")
   '("\n" "\n"))  

  (check-equal?
   (regexp-match (pregexp eol) "\r\n")
   '("\r\n" "\r\n"))

  (check-false
   (regexp-match (pregexp eol) "rn"))

  (check-equal?
   (regexp-match (pregexp WSP) "\t")
   '("\t"))

  (check-equal?
   (regexp-match (pregexp WSP) " ")
   '(" "))

  (check-false
   (regexp-match (pregexp WSP) "ns"))

  (check-equal?
   (regexp-match (pregexp *WSP) " \t   \t")
   '(" \t   \t"))

  (check-equal?
   (regexp-match (pregexp eolWSP) "\r")
   '("\r" "\r"))

  (check-equal?
   (regexp-match (pregexp eolWSP) "\n")
   '("\n" "\n"))

  (check-equal?
   (regexp-match (pregexp eolWSP) "\t")
   '("\t" "\t"))

  (check-equal?
   (regexp-match (pregexp eolWSP) " ")
   '(" " " "))

  (check-false
   (regexp-match (pregexp eolWSP) "a"))

  (check-equal?
   (regexp-match (pregexp *eolWSP) " \t   \t \r \n")
   '(" \t   \t \r \n" "\n"))

  (check-equal?
   (regexp-match (pregexp base64line)
                 "MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G                 \n")
   '("MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G                 \n"
    "MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G                 \n"
    "\n"))

  (check-equal?
   (regexp-match (pregexp *base64line)
                 "MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G                 \n")
   '("MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G                 \n"
    "MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G                 \n"
    "MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G                 \n"
    "\n"))

  (check-equal?
   (regexp-match (pregexp *base64line)
                 "MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G\nA1UEChMGR251VExTMSUwIwYDVQQLExxHbnVUTFMgY2VydGlmaWNhdGUgYXV0aG9y\naXR5MQ8wDQYDVQQIEwZMZXV2ZW4xJTAjBgNVBAMTHEdudVRMUyBjZXJ0aWZpY2F0\nZSBhdXRob3JpdHkwHhcNMTEwNTIzMjAzODIxWhcNMTIxMjIyMDc0MTUxWjB9MQsw\nCQYDVQQGEwJCRTEPMA0GA1UEChMGR251VExTMSUwIwYDVQQLExxHbnVUTFMgY2Vy\ndGlmaWNhdGUgYXV0aG9yaXR5MQ8wDQYDVQQIEwZMZXV2ZW4xJTAjBgNVBAMTHEdu\n")
   '("MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G\nA1UEChMGR251VExTMSUwIwYDVQQLExxHbnVUTFMgY2VydGlmaWNhdGUgYXV0aG9y\naXR5MQ8wDQYDVQQIEwZMZXV2ZW4xJTAjBgNVBAMTHEdudVRMUyBjZXJ0aWZpY2F0\nZSBhdXRob3JpdHkwHhcNMTEwNTIzMjAzODIxWhcNMTIxMjIyMDc0MTUxWjB9MQsw\nCQYDVQQGEwJCRTEPMA0GA1UEChMGR251VExTMSUwIwYDVQQLExxHbnVUTFMgY2Vy\ndGlmaWNhdGUgYXV0aG9yaXR5MQ8wDQYDVQQIEwZMZXV2ZW4xJTAjBgNVBAMTHEdu\n"
    "MIICLDCCAdKgAwIBAgIBADAKBggqhkjOPQQDAjB9MQswCQYDVQQGEwJCRTEPMA0G\nA1UEChMGR251VExTMSUwIwYDVQQLExxHbnVUTFMgY2VydGlmaWNhdGUgYXV0aG9y\naXR5MQ8wDQYDVQQIEwZMZXV2ZW4xJTAjBgNVBAMTHEdudVRMUyBjZXJ0aWZpY2F0\nZSBhdXRob3JpdHkwHhcNMTEwNTIzMjAzODIxWhcNMTIxMjIyMDc0MTUxWjB9MQsw\nCQYDVQQGEwJCRTEPMA0GA1UEChMGR251VExTMSUwIwYDVQQLExxHbnVUTFMgY2Vy\ndGlmaWNhdGUgYXV0aG9yaXR5MQ8wDQYDVQQIEwZMZXV2ZW4xJTAjBgNVBAMTHEdu\n"
    "dGlmaWNhdGUgYXV0aG9yaXR5MQ8wDQYDVQQIEwZMZXV2ZW4xJTAjBgNVBAMTHEdu\n"
    "\n"))

  (check-equal?
   (regexp-match (pregexp base64finl)
                 "l4wOuDwKQa+upc8GftXE2C//4mKANBC6It01gUaTIpo=\n")
   '("l4wOuDwKQa+upc8GftXE2C//4mKANBC6It01gUaTIpo=\n"
    "l4wOuDwKQa+upc8GftXE2C//4mKANBC6It01gUaTIpo=\n"
    "\n"))

  (check-equal?
   (regexp-match (pregexp label) "X-509 CERTIFICATE")
   '("X-509 CERTIFICATE"
     "X-509 CERTIFICATE"
     "E"))

  (check-equal?
   (regexp-match (pregexp preeb) "-----BEGIN X-509 CERTIFICATE-----")
   '("-----BEGIN X-509 CERTIFICATE-----"
     "X-509 CERTIFICATE"
     "E"))

  (define test-pem-body
  "MIICKzCCAZQCAQEwgZeggZQwgYmkgYYwgYMxCzAJBgNVBAYTAlVTMREwDwYDVQQI
DAhOZXcgWW9yazEUMBIGA1UEBwwLU3RvbnkgQnJvb2sxDzANBgNVBAoMBkNTRTU5
MjE6MDgGA1UEAwwxU2NvdHQgU3RhbGxlci9lbWFpbEFkZHJlc3M9c3N0YWxsZXJA
aWMuc3VueXNiLmVkdQIGARWrgUUSoIGMMIGJpIGGMIGDMQswCQYDVQQGEwJVUzER
MA8GA1UECAwITmV3IFlvcmsxFDASBgNVBAcMC1N0b255IEJyb29rMQ8wDQYDVQQK
DAZDU0U1OTIxOjA4BgNVBAMMMVNjb3R0IFN0YWxsZXIvZW1haWxBZGRyZXNzPXNz
dGFsbGVyQGljLnN1bnlzYi5lZHUwDQYJKoZIhvcNAQEFBQACBgEVq4FFSjAiGA8z
OTA3MDIwMTA1MDAwMFoYDzM5MTEwMTMxMDUwMDAwWjArMCkGA1UYSDEiMCCGHmh0
dHA6Ly9pZGVyYXNobi5vcmcvaW5kZXguaHRtbDANBgkqhkiG9w0BAQUFAAOBgQAV
M9axFPXXozEFcer06bj9MCBBCQLtAM7ZXcZjcxyva7xCBDmtZXPYUluHf5OcWPJz
5XPus/xS9wBgtlM3fldIKNyNO8RsMp6Ocx+PGlICc7zpZiGmCYLl64lAEGPO/bsw
Smluak1aZIttePeTAHeJJs8izNJ5aR3Wcd3A5gLztQ==
")

  (check-equal? 
   (list-ref (regexp-match (pregexp base64text) test-pem-body) 1)
   test-pem-body)

  (check-equal?
   (regexp-match (pregexp posteb) "-----END X-509 CERTIFICATE-----")
   '("-----END X-509 CERTIFICATE-----"
     "X-509 CERTIFICATE"
     "E"))

  (define testkey
"-----BEGIN ENCRYPTED PRIVATE KEY-----
MIHNMEAGCSqGSIb3DQEFDTAzMBsGCSqGSIb3DQEFDDAOBAghhICA6T/51QICCAAw
FAYIKoZIhvcNAwcECBCxDgvI59i9BIGIY3CAqlMNBgaSI5QiiWVNJ3IpfLnEiEsW
Z0JIoHyRmKK/+cr9QPLnzxImm0TR9s4JrG3CilzTWvb0jIvbG3hu0zyFPraoMkap
8eRzWsIvC5SVel+CSjoS2mVS87cyjlD+txrmrXOVYDE+eTgMLbrLmsWh3QkCTRtF
QC7k0NNzUHTV9yGDwfqMbw==
-----END ENCRYPTED PRIVATE KEY-----
")
  (check-equal? 
   (regexp-match pem-regexp testkey) 
   '("-----BEGIN ENCRYPTED PRIVATE KEY-----\nMIHNMEAGCSqGSIb3DQEFDTAzMBsGCSqGSIb3DQEFDDAOBAghhICA6T/51QICCAAw\nFAYIKoZIhvcNAwcECBCxDgvI59i9BIGIY3CAqlMNBgaSI5QiiWVNJ3IpfLnEiEsW\nZ0JIoHyRmKK/+cr9QPLnzxImm0TR9s4JrG3CilzTWvb0jIvbG3hu0zyFPraoMkap\n8eRzWsIvC5SVel+CSjoS2mVS87cyjlD+txrmrXOVYDE+eTgMLbrLmsWh3QkCTRtF\nQC7k0NNzUHTV9yGDwfqMbw==\n-----END ENCRYPTED PRIVATE KEY-----\n"
    "ENCRYPTED PRIVATE KEY"
    "Y"
    "\n"
    #f
    "MIHNMEAGCSqGSIb3DQEFDTAzMBsGCSqGSIb3DQEFDDAOBAghhICA6T/51QICCAAw\nFAYIKoZIhvcNAwcECBCxDgvI59i9BIGIY3CAqlMNBgaSI5QiiWVNJ3IpfLnEiEsW\nZ0JIoHyRmKK/+cr9QPLnzxImm0TR9s4JrG3CilzTWvb0jIvbG3hu0zyFPraoMkap\n8eRzWsIvC5SVel+CSjoS2mVS87cyjlD+txrmrXOVYDE+eTgMLbrLmsWh3QkCTRtF\nQC7k0NNzUHTV9yGDwfqMbw==\n"
    "MIHNMEAGCSqGSIb3DQEFDTAzMBsGCSqGSIb3DQEFDDAOBAghhICA6T/51QICCAAw\nFAYIKoZIhvcNAwcECBCxDgvI59i9BIGIY3CAqlMNBgaSI5QiiWVNJ3IpfLnEiEsW\nZ0JIoHyRmKK/+cr9QPLnzxImm0TR9s4JrG3CilzTWvb0jIvbG3hu0zyFPraoMkap\n8eRzWsIvC5SVel+CSjoS2mVS87cyjlD+txrmrXOVYDE+eTgMLbrLmsWh3QkCTRtF\n"
    "8eRzWsIvC5SVel+CSjoS2mVS87cyjlD+txrmrXOVYDE+eTgMLbrLmsWh3QkCTRtF\n"
    "\n"
    "QC7k0NNzUHTV9yGDwfqMbw==\n"
    "\n"
    "ENCRYPTED PRIVATE KEY"
    "Y"
    "\n"))

  (check-equal? 
   (regexp-replace* #rx"\r|\n"
                    (bytes->string/latin-1 (base64-encode (pem-body (pem-string->pem testkey)))) "")
   (regexp-replace* #rx"\r|\n"
                    (list-ref (regexp-match pem-regexp testkey) 5) ""))

  (check-equal?
   (regexp-replace* #rx"\r|\n" (pem->pem-string (pem-string->pem testkey)) "")
   (regexp-replace* #rx"\r|\n" testkey ""))
  )
