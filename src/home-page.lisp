(in-package :tutoring-site)

(defclass primary-layout (page)
  ())

(defmethod display-header ((page primary-layout) status)
  (with-html
    (:h1 (title page))))

(defmethod display-nav ((page primary-layout) status)
  (with-html
      (:a :href "/" "Home")
    (:a :href "/info.html" "Info")
    ;; (:a :href "/art" "Art")
    ))


(defclass home-page (primary-layout)
  ())


(defun make-accordion (list)
  (with-html
    (:details
     (:summary (car list))
     (:ul (dolist (item (cdr list))
       (:li item))))))

(defun read-server-txt-lines (name)
  (uiop:read-file-lines (merge-pathnames *text-dir* (pathname name))))

 (defmethod display-main ((page home-page) status)
   (with-html
     (:h2 "About Me")
     (:aside (:img :alt "Andrew Horn" :src "me.jpg"))
     (dolist (item (read-server-txt-lines "HomepageBlurb.txt"))
       (:p item))
     (:h2 "Subjects I Tutor")
     (map 'list #'(lambda (x) (make-accordion (read-server-txt-lines x))) '("Math.txt" "Science.txt" "Engineering.txt"))))

(defclass art-page (primary-layout)
  ())

(defmethod display-main ((page art-page) status)
  (with-html
    (:p "Do u want to seeee my art leezard?")))

(defclass info-page (primary-layout)
  ())

(defmethod display-main ((page info-page) status)
  (with-html
    (:h5 "What's your contact info?")
    (:p "Email me at: " (:i "a.horncompmail@gmail.com"))
    (:h5 "What does a session cost?")
    (:ul (:li "$50 per hour, $40 if schelduled for 3 or more hrs a week.")
         (:li "$30 per hour per person for group schelduling.")
         (:li "$20 per hour for my large classes.")
         )
    (:h5 "What if I need help with a 2 minute problem?")
    (:p "Feel free to email me for help anytime!")
    (:h5 "What times do you tutor?")
    (:p "9-5 CT, Monday - Friday.")
    (:p "I can work in the evenings as necessary.")
    (:h5 "How early should I scheldule a meeting?")
    (:p "At least 24 hours before you want to meet. During midterms or finals, I suggest schelduling the week before.")
    (:h5 "What meeting software do you use?")
    (:p "Google Meets")
    (:h5 "What should I send you for tutoring?")
    (:p "Email me any materials or questions you want to go over! If you are not sure what to send, let me know. I will find materials to work with!")
    (:h5 "Can you help me with something not on your topic list?")
    (:p "Shoot me an email and I will give you my thoughts! I love trying out new topics and if I feel I could help, would be willing to offer a discount to try something new.")))
