(in-package :tutoring-site)

(defvar *acceptor* (make-instance 'hunchentoot:easy-acceptor
                                  :port 4242
                                  :address "0.0.0.0"))
(defun start-server () (hunchentoot:start *acceptor*))
(defun stop-server () (hunchentoot:stop *acceptor*))

(hunchentoot:define-easy-handler (home :uri "/") ()
  (display-page (make-instance 'home-page)
                (make-instance 'status)))

(hunchentoot:define-easy-handler (art :uri "/art") ()
  (display-page (make-instance 'art-page)
                (make-instance 'status)))

(hunchentoot:define-easy-handler (info :uri "/info") ()
  (display-page (make-instance 'info-page)
                (make-instance 'status)))
