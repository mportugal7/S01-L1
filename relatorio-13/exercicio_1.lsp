(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (cond
    ((>= (erva-toxicidade erva) 7) "veneno")
    ((>= (erva-toxicidade erva) 4) "use com cuidado")
    (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - Preco por grama: R$ ~,2f - Classificacao: ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Maomao vai testar esta erva em si mesma antes!"
      "Erva liberada para o paciente."))

(defun main ()
  (let* ((erva1 (make-erva :nome "Ginseng"
                           :preco-por-grama 2.50
                           :toxicidade 2))

         (erva2 (make-erva :nome "Artemisia"
                           :preco-por-grama 4.00
                           :toxicidade 5))

         (erva3 (make-erva :nome "Aconito"
                           :preco-por-grama 8.00
                           :toxicidade 9))

         (ervas (list erva1 erva2 erva3)))

    (format t "--- Ervas do estoque ---~%")

    (dolist (erva ervas)
      (format t "~a~%" (descreve-erva erva))
      (format t "~a~%~%" (aviso erva)))

    (format t "--- Preco da dose ---~%")
    (format t "Dose de Ginseng com 5 gramas: R$ ~,2f~%"
            (preco-da-dose erva1 5))))

(main)
