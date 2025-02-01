(ql:quickload '(:sdl2 :cffi :imgui))  ;; Ensure you have these libraries

(defpackage :imgui-demo
  (:use :cl :sdl2 :imgui-ffi.fns :cffi))

(in-package :imgui-demo)

(defun main-loop ()
  "Creates an SDL2 window and renders an ImGui interface."
  (sdl2:with-init (:video)
    (sdl2:with-window (win :title "ImGui Lisp Demo" :w 800 :h 600 :flags '(:shown :opengl))
      (sdl2:with-gl-context (ctx win)
        ;; Initialize ImGui
        (imgui-ffi.fns:igCreateContext)
        (let ((running t))
          (loop while running do
            (sdl2:with-event-loop (:quit (setf running nil)))

            ;; Start ImGui frame
            (imgui-ffi.fns:igNewFrame)

            ;; Create a simple ImGui window
            (when (imgui-ffi.fns:igBegin "Hello, Lisp!" (cffi:null-pointer) 0)
              (imgui-ffi.fns:igText "Welcome to Common Lisp + ImGui!")
              (imgui-ffi.fns:igEnd))

            ;; Render ImGui
            (imgui-ffi.fns:igRender)

            ;; Swap buffers
            (sdl2:gl-swap-window win)))

        ;; Cleanup
        (imgui-ffi.fns:igDestroyContext)))))
