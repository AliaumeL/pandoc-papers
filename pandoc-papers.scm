(define-module (guix-packager)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download))

(define-public pandoc-papers
  (package
    (name "pandoc-papers")
    (version "0.0.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/AliaumeL/pandoc-papers.git")
              (commit "782722b")))
        (file-name (git-file-name name version))
        (sha256 (base32 "16l06bsxqsc7qg25x9qwrz1sscnkv2z10pj1ja8qrq9mvsdb3g1k"))))
    (build-system gnu-build-system)
    ; remove the configure phase since there is no configure script
    (arguments (list 
                     #:tests? #f
                     #:phases
                      #~(modify-phases %standard-phases
                          (delete 'configure))))
    (home-page "https://aliaumel.github.io/pandoc-papers/")
    (synopsis "A collection of Pandoc templates and styles for academic papers")
    (description "A collection of Pandoc templates for computer science conference papers, including ACM and IEEE styles.")
    (license license:gpl3+)))

;; This allows you to run guix shell -f guix-packager.scm.
;; Remove this line if you just want to define a package.
pandoc-papers
