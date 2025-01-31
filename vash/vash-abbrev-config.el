(provide 'vash-abbrev-config)
;
;          1         2         3         4
;; 1234567890123456789012345678901234567890
;; #include <>
;; if () {\n \n}\n else {\n \n}

(defconst c++-expand-list
  '(("aife" "if () {\n\n}\n else {\n\n}" (5 9 20))
    ("aif" "if () {\n\n}" (5 9))
    ("afor" "for () {\n\n}" (6 10))
    ("astd" "std::" 6)
    ("aincg" "#include <>" 11)
    ("aincl" "#include \"\""  11))

  "Expansions for C++ mode")

(add-hook 'c++-mode-hook
          (lambda ()
            (expand-add-abbrevs c++-mode-abbrev-table c++-expand-list)
            (abbrev-mode 1)))
