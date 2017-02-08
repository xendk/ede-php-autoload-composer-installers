;;; Commentary: Originally stolen from ede-php-autoload and adapted.
(require 'package)
(require 'f)
(require 'cl-lib)
(require 'ert)
(require 'eieio)
(require 'ede-php-autoload)

(defvar ede-autoload-installers-support-path
  (f-dirname load-file-name))

(defvar ede-autoload-installers-features-path
  (f-parent ede-autoload-installers-support-path))

(defvar ede-autoload-installers-root-path
  (f-parent ede-autoload-installers-features-path))

(defvar ede-autoload-installers-test-projects-root-path
  (f-join ede-autoload-installers-root-path "test/projects"))

(defun ede-autoload-installers-test-get-project-file-path (file project)
  "Return the absolute path for FILE relative to PROJECT."
  (f-join ede-autoload-installers-test-projects-root-path project file))

(defun ede-autoload-installers-test-get-current-project-name ()
  "Return the test project currently visited."
  (car
   (f-split
    (f-relative
     (or (buffer-file-name) default-directory)
     ede-autoload-installers-test-projects-root-path))))

(add-to-list 'load-path ede-autoload-installers-root-path)

(package-generate-autoloads "ede-autoload-installers" ede-autoload-installers-root-path)
(load (f-join ede-autoload-installers-root-path "ede-autoload-installers-autoloads.el"))

(Setup
 (require 'ede-autoload-installers)
 (global-ede-mode 1))
