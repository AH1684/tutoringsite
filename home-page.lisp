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

(defmethod display-body ((page home-page) status)
  (with-html
    (:p "Here is an example homepage. Learn or die. :\)")))

(defclass art-page (primary-layout)
  ())

(defmethod display-body ((page art-page) status)
  (with-html
    (:p "Do u want to seeee my art leezard?")))

(defclass info-page (primary-layout)
  ())

(defmethod display-body ((page info-page) status)
  (with-html
    (:p "hello, this is where I list my murders.")))
