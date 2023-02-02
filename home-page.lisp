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

(defvar *math-list* '("Trigonometry & Pre-Calc"
                      "Diffrential, Integral, & Multivariable Calculus (1-3)"
                      "Ordinary Differential Equations"
                      "Introductory Statistics"
                      "Probability"
                      "Discrete Mathematics"
                      "Partial Differential Equations"
                      "Real Analysis"
                      "Modern Geometry"
                      "Modern Algebra"))
(defvar *science-list* '("University Physics - Newtonian Mechanics"
                         "University Physics - Electricity & Magnetism"
                         "Thermodynamics & Optics"
                         "Introductory Chemistry"))
(defvar *engineering-list* '("Statics"
                             "Engineering Dynamics"
                             "Controls"
                             "Materials Science"
                             "Thermodynamics"
                             "Fluid Mechanics"
                             "Gas Dynamics"
                             "Numeric Methods"
                             "Electronic Circuits"
                             ))

(defun make-accordion (summary list)
  (with-html
    (:details
     (:summary summary)
     (:ul (dolist (item list)
       (:li item))))))

(defmethod display-main ((page home-page) status)
  (with-html
    (:h2 "About Me")
    (:aside (:img :alt "Andrew Horn" :src "me.jpg"))
    (:p "I tutor university students in STEM. ")
    (:h2 "Subjects I Tutor")
    (make-accordion "University Mathematics" *math-list*)
    (make-accordion "Introductory Science" *science-list*)
    (make-accordion "Engineering" *engineering-list*)))

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
