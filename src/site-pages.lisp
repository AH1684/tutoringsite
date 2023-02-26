(in-package :tutoring-site)

;Okay, start small w/ the HTML. Let's make a simple page.
;Hey, I did it! Now time to wrangle it into a fully functional page.

(defclass page ()
  ((title
    :initarg :title
    :accessor title
    :initform "A. Horn - Online University Tutor")))

(defclass status ()
  ())

(defgeneric display-page (page status)
  (:documentation "Renders a page into HTML."))


(defmethod display-page (page status)
  (with-html-string
    (:html
     (:head
      (display-css page status))
     (:body
      (:header
       (display-header page status))
      (:main
       (display-main page status))
      (:footer
       (display-footer page status))))))

(defgeneric display-header (page status)
  (:documentation "Displays the header of a page. Calls display-nav after."))

(defmethod display-header (page status)
  (with-html
    (:h1 (title page))))

(defmethod display-header :after (page status)
  (with-html
    (:nav (display-nav page status))))

(defgeneric display-nav (page status)
  (:documentation "Displays the nav section."))

(defmethod display-nav (page status)
  nil)

(defgeneric display-main (page status))

(defmethod display-main (page status)
  nil)

(defgeneric display-footer (page status)
  (:documentation "Displays the footer section."))

(defmethod display-footer (page status)
  nil)

(defgeneric display-css (page status))

(defmethod display-css (page status)
  (with-html
    (:link :rel "stylesheet" :href "simple.css")))

(defclass 404Page (page)
  ()
  (:default-initargs
   :title "404 - Page Not Found"))
