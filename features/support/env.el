;;; Commentary: Originally stolen from ede-php-autoload and adapted.
(require 'package)
(require 'f)
(require 'cl-lib)
(require 'ert)
(require 'eieio)
(require 'ede-php-autoload)

(defvar ede-php-autoload-composer-installers-support-path
  (f-dirname load-file-name))

(defvar ede-php-autoload-composer-installers-features-path
  (f-parent ede-php-autoload-composer-installers-support-path))

(defvar ede-php-autoload-composer-installers-root-path
  (f-parent ede-php-autoload-composer-installers-features-path))

(defvar ede-php-autoload-composer-installers-test-projects-root-path
  (f-join ede-php-autoload-composer-installers-root-path "test/projects"))

(defun ede-php-autoload-composer-installers-test-get-project-file-path (file project)
  "Return the absolute path for FILE relative to PROJECT."
  (f-join ede-php-autoload-composer-installers-test-projects-root-path project file))

(defun ede-php-autoload-composer-installers-test-get-current-project-name ()
  "Return the test project currently visited."
  (car
   (f-split
    (f-relative
     (or (buffer-file-name) default-directory)
     ede-php-autoload-composer-installers-test-projects-root-path))))

(add-to-list 'load-path ede-php-autoload-composer-installers-root-path)

(package-generate-autoloads "ede-php-autoload-composer-installers" ede-php-autoload-composer-installers-root-path)
(load (f-join ede-php-autoload-composer-installers-root-path "ede-php-autoload-composer-installers-autoloads.el"))

(Setup
 (require 'ede-php-autoload-composer-installers)
 (global-ede-mode 1))
