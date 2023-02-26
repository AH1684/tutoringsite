(ql:quickload :tutoring-site-sys)
(in-package :tutoring-site)
(defun build-page (page name)
  (with-open-file (file-output (merge-pathnames *www-dir* name)
                   :direction :output
                   :if-exists :supersede
                   :if-does-not-exist :create)
    (format file-output "~a" (display-page page t))))

(build-page (make-instance 'home-page) "index.html")
(build-page (make-instance 'info-page) "info.html")
(build-page (make-instance '404page) "404.html")
(build-page (make-instance 'reviews) "reviews.html")
