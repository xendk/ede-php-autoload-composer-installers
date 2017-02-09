;; Originally stolen from ede-php-autoload and adapted.

(defvar ede-autoload-installers-project-paths)

(Before
 ;; Ensure we start with an unconfigured state.
 (setq ede-autoload-installers-project-paths ()))


(Given "^I have configured the project types:$"
  (lambda (types)
    (setq ede-autoload-installers-project-paths (cl-loop for row in (cdr types)
             collect (cons (car row) (car (cdr row)))))))

(When "^I visit \"\\(.+\\)\" in project \"\\(.+\\)\"$"
  (lambda (file-path project-name)
    (find-file (ede-autoload-installers-test-get-project-file-path file-path project-name))))

(Then "^ede-php-autoload-project should exist$"
  (lambda ()
    (should (ede-php-autoload-project-p (ede-current-project)))))

(Then "^the class \"\\(.+\\)\" should be detected in \"\\(.+\\)\"$"
  (lambda (class-name file-path)
    (should
     (string=
      (ede-autoload-installers-test-get-project-file-path
       file-path
       (ede-autoload-installers-test-get-current-project-name))
      (ede-php-autoload-find-class-def-file (ede-current-project) class-name)))))

(Then "^the class \"\\(.+\\)\" should not be detected"
  (lambda (class-name)
    (should-not (ede-php-autoload-find-class-def-file (ede-current-project) class-name))))

(Then "^guessing the class name for \"\\(.+\\)\" should return \"\\(.+\\)\""
  (lambda (file-name class-name)
    (should (string= (ede-php-autoload-get-class-name-for-file
                      (ede-current-project)
                      file-name)
                     class-name))))

(Then "^completions for query \"\\(.+\\)\" should be:"
  (lambda (query suggestion-table)
    (should (equal (ede-php-autoload-complete-type-name (ede-current-project) query)
                   (car suggestion-table)))))

(Then "^I should see a \"\\([^\"]+\\)\" warning$"
  (lambda (expected)
    (should
     (with-current-buffer "*Warnings*" (s-contains? expected (buffer-string))))))
