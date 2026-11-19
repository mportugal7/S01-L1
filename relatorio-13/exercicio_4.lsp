(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d)
     (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((dominios-disponiveis
           (remove-if-not
             (lambda (d)
               (<= (dominio-dificuldade d) dificuldade-maxima))
             lista))

         (textos
           (mapcar
             (lambda (d)
               (format nil "~a - Recompensa: ~,2f mora"
                       (dominio-nome d)
                       (recompensa-final d)))
             dominios-disponiveis)))

    textos))

(defun main ()
  (let* ((dominio1 (make-dominio
                     :nome "Vale das Lembrancas"
                     :elemento :anemo
                     :dificuldade 2
                     :mora 1000))

         (dominio2 (make-dominio
                     :nome "Palacio Oculto da Formula Zhou"
                     :elemento :pyro
                     :dificuldade 3
                     :mora 1500))

         (dominio3 (make-dominio
                     :nome "Jardim de Cecilia"
                     :elemento :electro
                     :dificuldade 4
                     :mora 2000))

         (dominio4 (make-dominio
                     :nome "Piscina Clara e Caverna da Montanha"
                     :elemento :hydro
                     :dificuldade 5
                     :mora 2500))

         (dominio5 (make-dominio
                     :nome "Pico de Vindagnyr"
                     :elemento :cryo
                     :dificuldade 1
                     :mora 800))

         (lista (list dominio1 dominio2 dominio3 dominio4 dominio5))

         (textos-rota (rota lista 3))

         (total-mora
           (reduce #'+ (mapcar #'recompensa-final lista)))

         (copia (copy-dominio dominio3)))

    (format t "--- Rota para dificuldade maxima 3 ---~%")

    (dolist (texto textos-rota)
      (format t "~a~%" texto))

    (format t "~%Total de mora de todos os dominios: ~,2f~%"
            total-mora)

    (format t "~%--- Copia de um dominio ---~%")

    (setf (dominio-mora copia) 5000)

    (format t "Mora da copia: ~a~%" (dominio-mora copia))
    (format t "Mora do original: ~a~%" (dominio-mora dominio3))))

(main)
