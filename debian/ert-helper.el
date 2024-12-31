(require 'cl-lib)
;; The upstream Makefile runs their tests with the following expression:
(setq byte-compile-warnings (quote (not cl-functions)))
;; Byte-compile the test suite before running it, like upstream's Makefile
(cl-loop for f in
         (directory-files-recursively default-directory ".*\\.el$") do
         (byte-compile-file f))
(cd "tests")
