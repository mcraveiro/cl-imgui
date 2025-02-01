(in-package :imgui)

;; stolen from cl-autowrap, cause i'm lazy!
(defun asdf-path (system &rest path)
  (asdf:component-pathname
   (or (asdf:find-component (asdf:find-system system t) path)
       (error "System ~S path not found: ~S" system path))))

(defun imgui-path (name)
  (asdf-path 'imgui 'imgui-lib name))

(eval
`(cffi:define-foreign-library imgui
  (:darwin    "cimgui.so"  :search-path ,(asdf-path 'imgui 'imgui-lib))
  (:unix      "cimgui.so"  :search-path ,(asdf-path 'imgui 'imgui-lib))
  (:windows   "cimgui.dll" :search-path ,(asdf-path 'imgui 'imgui-lib))
  (t          "cimgui.so"  :search-path ,(asdf-path 'imgui 'imgui-lib))))

(cffi:use-foreign-library imgui)
