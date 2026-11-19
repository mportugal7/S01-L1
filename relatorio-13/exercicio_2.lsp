(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a - Bioma: ~a - Profundidade: ~a metros - Perigo: ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not
    (lambda (c)
      (> (criatura-profundidade c) metros))
    catalogo))

(defparameter *catalogo*
  (list
    (make-criatura :nome "Peixe Bolha"
                   :bioma "Floresta de Algas"
                   :profundidade 100
                   :perigo :inofensiva)

    (make-criatura :nome "Stalker"
                   :bioma "Floresta de Algas"
                   :profundidade 150
                   :perigo :agressiva)

    (make-criatura :nome "Reaper Leviathan"
                   :bioma "Planaltos Gramineos"
                   :profundidade 400
                   :perigo :leviata)

    (make-criatura :nome "Ghost Leviathan"
                   :bioma "Rio Perdido"
                   :profundidade 800
                   :perigo :leviata)))

(defun main ()
  (let* ((textos (mapcar #'descreve-criatura *catalogo*))
         (criaturas-profundas (abaixo-de 300 *catalogo*))
         (textos-profundos (mapcar #'descreve-criatura criaturas-profundas)))

    (format t "--- Catalogo completo ---~%")

    (dolist (texto textos)
      (format t "~a~%" texto))

    (format t "~%--- Criaturas abaixo de 300 metros ---~%")

    (dolist (texto textos-profundos)
      (format t "~a~%" texto))

    (format t "~%Quantidade de criaturas abaixo de 300 metros: ~a~%"
            (length criaturas-profundas))))

(main)
