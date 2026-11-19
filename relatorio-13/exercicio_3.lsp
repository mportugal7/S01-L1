(defstruct garota-magica
  nome
  escuridao
  bruxas)
(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica
    :nome (garota-magica-nome g)
    :escuridao (if (>= quantidade (garota-magica-escuridao g))
                   0
                   (- (garota-magica-escuridao g) quantidade))
    :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((madoka (make-garota-magica
                   :nome "Madoka"
                   :escuridao 40
                   :bruxas 3))

         (homura (make-garota-magica
                   :nome "Homura"
                   :escuridao 70
                   :bruxas 8))

         (sayaka (make-garota-magica
                   :nome "Sayaka"
                   :escuridao 60
                   :bruxas 4))

         (grupo (list madoka homura sayaka))

         (mami (make-garota-magica
                 :nome "Mami"
                 :escuridao 20
                 :bruxas 5))

         (novo-grupo (cons mami grupo))

         (homura-purificada (purifica homura 30)))

    (format t "--- Grupo original ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas derrotadas: ~a~%"
            (total-de-bruxas grupo))

    (format t "~%--- Novo grupo ---~%")
    (format t "Escuridao total: ~a~%"
            (escuridao-total novo-grupo))

    (format t "~%--- Purificacao da Homura ---~%")
    (format t "Escuridao original: ~a~%"
            (garota-magica-escuridao homura))
    (format t "Escuridao nova: ~a~%"
            (garota-magica-escuridao homura-purificada))))

(main)
