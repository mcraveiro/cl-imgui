(asdf:asdf-version)
(asdf:load-system "imgui")
(setf autowrap:*c2ffi-program* "/home/marco/Development/lisp/c2ffi/build/bin/c2ffi")
(load "imgui-demo.lisp")
(do-external-symbols (s (find-package "IMGUI-FFI.ACC"))
  (print s))
(asdf:clear-system "imgui")
(in-package cl-user)

(ig-get-version)
