;;; html-ts-mode.el --- major mode to edit HTML files, using tree-sitter  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Andrew De Angelis

;; Author: Andrew De Angelis <bobodeangelis@gmail.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This program is a very small proof-of-concept implementation of an
;; HTML mode using tree-sitter.
;; The code is mostly copied from:
;; www.gnu.org/software/emacs/manual/html_node/elisp/Multiple-Languages.html

;;; Code:
(define-derived-mode html-ts-mode html-mode "html[ts]"
  "Major mode for editing HTML using tree-sitter grammar."

  (when (treesit-ready-p 'html)
    (treesit-parser-create 'html)
    (treesit-major-mode-setup)))

(setq js-query '((script_element (raw_text) @capture)))
(setq css-query '((style_element (raw_text) @capture)))

(defun html-set-treesitter-range ()
  (interactive)
  (setq treesit-range-settings
        (treesit-range-rules
         :embed 'javascript
         :host 'html
         js-query


         :embed 'css
         :host 'html
         css-query)))


(provide 'html-ts-mode)
;;; html-ts-mode.el ends here
