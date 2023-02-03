(in-package :tutoring-site)

(defclass primary-layout (page)
  ())

(defmethod display-header ((page primary-layout) status)
  (with-html
    (:h1 (title page))))

(defmethod display-nav ((page primary-layout) status)
  (with-html
    (:a :href "/" "Home")
    (:a :href "/art" "Art")
    (:a :href "/info" "Info")))

(defclass home-page (primary-layout)
  ())


(defun make-accordion (list)
  (with-html
    (:details
     (:summary (car list))
     (:ul (dolist (item (cdr list))
       (:li item))))))

 (defmethod display-main ((page home-page) status)
  (with-html
    (:h2 "About Me")
    (:aside (:img :alt "Andrew Horn" :src "me.jpg"))
    (:p "I tutor university students in STEM together to build a ground-up understanding of the subject ")
    (:h2 "Subjects I Tutor")
    (dolist (item (list *math-list* *science-list* *engineering-list*))
      (make-accordion item))))

(defclass art-page (primary-layout)
  ())

(defmethod display-main ((page art-page) status)
  (with-html
    (:p "Do u want to seeee my art leezard?")))

(defclass info-page (primary-layout)
  ())

(defmethod display-main ((page info-page) status)
  (with-html
    (:p "hello, this is where I list my murders.")))
