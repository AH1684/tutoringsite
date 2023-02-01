(in-package :tutoring-site)

;Okay, start small w/ the HTML. Let's make a simple page.
;Hey, I did it! Now time to wrangle it into a fully functional page.

(defvar *www-dir* (asdf:system-relative-pathname "tutoring-site-sys" "www/"))

(defclass page ()
  ((title
    :initarg :title
    :accessor title
    :initform "Horn University Tutoring")))

(defclass status ()
  ())

(defgeneric display-page (page status)
  (:documentation "Renders a page into HTML."))


(defmethod display-page (page status)
  (with-html-string
    (:html
     (:head
      (display-css page status))
     (:header
      (display-header page status))
     (:body
      (display-body page status))
     (:footer
      (display-footer page status)))))

(defgeneric display-header (page status)
  (:documentation "Displays the header of a page. Calls display-nav after."))

(defmethod display-header (page status)
  nil)

(defmethod display-header :after (page status)
  (with-html
    (:nav (display-nav page status))))

(defgeneric display-nav (page status)
  (:documentation "Displays the nav section."))

(defmethod display-nav (page status)
  nil)

(defgeneric display-body (page status))

(defmethod display-body (page status)
  (with-html
    (:p "Lorem Ipsum")))

(defgeneric display-footer (page status))

(defmethod display-footer (page status)
  nil)

(defgeneric display-css (page status))

(defmethod display-css (page status)
  (with-html
    (:link :rel "stylesheet" :href "simple.css")))
