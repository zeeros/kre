; Declare a class CAR with a slot Color, and make an instance of car with color "blue"

(defclass CAR (is-a USER) (slot color))
(make-instance My-Car of CAR (color "blue"))
(send [My-Car] get-color)
(send [My-Car] put-color "green")
(send [My-Car] get-color)

; Redefine class CAR with slot Color default value "black"

(reset)
(defclass CAR (is-a USER) (slot color (type STRING) (default "black")))
(make-instance My-Car of CAR)
(send [My-Car] get-color)
(send [My-Car] put-color "green")
(send [My-Car] get-color)

; Define a subclass CLASSIC-CAR of CLASS and check that it inherits default black color from CAR

(defclass CLASSIC-CAR (is-a CAR))
(make-instance [My-Classic-Car] of CLASSIC-CAR)
(send [My-Classic-Car] get-color)

; Define a class PERSON with a slot person-name and three persons John, Mary, and Peter

(defclass PERSON (is-a USER) (slot person-name (type STRING) (default "Unknown")))
(make-instance John of PERSON (person-name "John"))
(make-instance Mary of PERSON (person-name "Mary"))
(make-instance Peter of PERSON)
(send [Mary] get-person-name)

; Redefine CAR class to contain a multislot with the passengers being a list of PERSON instances

(unmake-instance [My-Car])
(defclass CAR (is-a USER) (slot color (default "black")) (multislot passengers (type INSTANCE) (allowed-classes PERSON)))
(make-instance My-Car of CAR (passengers [John] [Mary]))
(send [My-Car] print)

; Show the current available classes and instances

(browse-classes)
(instances)

; Modify PERSON to contain the weight of the person-name

(unmake-instance *)
(instances)
(defclass PERSON (is-a USER) (slot person-name (type STRING) (default "Unknown")) (slot weight (type NUMBER)))
(make-instance John of PERSON (person-name "John") (weight 80))
(make-instance Mary of PERSON (person-name "Mary") (weight 50))
(make-instance Peter of PERSON (weight 90))
(send [Peter] print)

; Indicate that John and Mary are passengers of my-car

(make-instance My-Car of CAR (passengers [John] [Mary]))
(send [My-Car] print)

; Make John out of the car and Peter in

(send [My-Car] get-passengers)
(slot-delete$ [My-Car] passengers 1 1))
(slot-insert$ [My-Car] passengers 1 [Peter])
(send [My-Car] get-passengers)

; alternatively

(slot-replace$ [My-Car] passengers 1 1 [Peter])

; Make a message to obtain the number of passengers in a car

(defmessage-handler CAR numpassengers () (lenght$ ?self:passengers))
(send [My-Car] numpassengers)

; Make a message to CAR that calculates its load as the accumulation of the weights of all the passengers

(defmessage-handler CAR get-load ()
  (progn (bind ?load 0)
         (loop-for-count (?i 1 (length$ ?self:passengers))
			(bind ?load (+ ?load (send (nth$ ?i ?self:passengers) get-weight))))
		 ?load))

; (defmessage-handler CAR get-load () (progn (bind ?load 0) (loop-for-count (?i 1 (length$ ?self:passengers)) (bind ?load (+ ?load (send (nth$ ?i ?self:passengers) get-weight)))) ?load))

(send [My-Car] get-load)

; Implement the same functionality by adding load as a CAR slot that is autocalculated

(reset)
;; remove message-handler get-load with CLOOS framework
(defclass CAR (is-a USER) (slot color (default "black")) (multislot passengers (type INSTANCE) (allowed-classes PERSON)) (slot load))
(make-instance John of PERSON (person-name "John") (weight 80))
(make-instance Mary of PERSON (person-name "Mary") (weight 50))
(make-instance Peter of PERSON (weight 90))
(make-instance My-Car of CAR (passengers [John] [Mary] [Peter]))

(defmessage-handler CAR get-load around ()
  (progn (call-next-handler)
         (bind ?load 0)
         (loop-for-count (?i 1 (length$ ?self:passengers))
			(bind ?load (+ ?load (send (nth$ ?i ?self:passengers) get-weight))))
		 ?load))

(send [My-Car] get-load)

; Simple example on handlers shadowing

(reset)
(defclass CAR (is-a USER) (slot color))
(make-instance My-Car of CAR)

(defmessage-handler CAR put-color before (?color) (printout t "Wanted to insert color " ?color crlf))
(send [My-Car] put-color "Black")

(defmessage-handler CAR put-color after (?color) (printout t "Final inserted color " ?color crlf))
(send [My-Car] put-color "Black")

(defmessage-handler CAR put-color around (?color) (printout t "Color is not changed" crlf) (call-next-handler))
(send [My-Car] put-color "Black")

(defmessage-handler CAR put-color around (?color) (call-next-handler) (printout t "Color is not changed" crlf))
(send [My-Car] put-color "Black")

(defmessage-handler CAR put-color around (?color) (printout t "Color is not changed" crlf) (override-next-handler "White"))
(send [My-Car] put-color "Black")

(defmessage-handler CAR put-color around (?color) (override-next-handler "White") (printout t "Color is not changed" crlf))
(send [My-Car] put-color "Black")
