(asdf:defsystem #:tutoring-site-sys
  :description "Webserver for the tutoring site."
  :author "ahorn40K@gmail.com"
  :depends-on (:hunchentoot :str :spinneret :local-time)
  :components ((:file "packages")
               (:file "webserver")
               (:file "site-pages")
               (:file "home-page")))
