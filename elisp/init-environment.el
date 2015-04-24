(setq-default initial-scratch-message
	      (concat ";; Happy hacking " (or user-login-name "") "!\n\n"))


(require-package 'exec-path-from-shell)
;;If necessary, add JDK_HOME or JAVA_HOME to the environment
;;(setenv "JDK_HOME" "/path/to/jdk")
;;If necessary, make sure "sbt" and "scala" are in the PATH environment
;;(setenv "PATH" (concat "/usr/local/sbt/bin:" (getenv "PATH")))
;;(setenv "PATH" (concat "/path/to/scala/bin:" (getenv "PATH")))
;;You can also customize `ensime-inf-get-project-root' and `ensime-inf-get-repl-cmd-line'
;;Read path from shell(for mac os x)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOROOT")
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "MITSCHEME_LIBRARY_PATH"))


(provide 'init-environment)
