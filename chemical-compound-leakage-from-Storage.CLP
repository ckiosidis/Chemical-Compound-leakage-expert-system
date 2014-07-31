


;+ Kiosidis Charalampos
;+ Second Project on Knowledge Systems Course


;+ pons file



(defclass ChemicalCompound "An abstract class that describes an acid, a base or an oil"
;+	(is-a %3ASYSTEM-CLASS)
        (is-a USER)
	(role abstract)
	(single-slot colour
		(type SYMBOL)
		(allowed-values red white none)
		(default none)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot spectroscopy
;+		(comment "The branch of science concerned with the investigation and measurement of spectra produced when matter interacts with or emits electromagnetic radiation")
		(type SYMBOL)
		(allowed-values Carbon Sulfur no_results Natrium Metal)
		(default no_results)
		(create-accessor read-write))
	(single-slot chname
;+		(comment "The specific name of the substance")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot corrosive
;+		(comment "\"A corrosive substance is one that will destroy or irreversibly damage another surface or substance with which it comes into contact. \"\nwikipedia.org")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot smell
		(type SYMBOL)
		(allowed-values choking vinegar none)
		(default none)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot chemical+formula
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot radioactivity
;+		(comment "Describes if the substance is radioactive, any substance that contains one or more radionuclides and whose activity or activity concentration cannot be disregarded as far as radiation protection is concerned.")
		(type SYMBOL)
		(allowed-values no yes)
		(default no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot specific+gravity
;+		(comment "\"Relative density, or specific gravity, is the ratio of the density (mass of a unit volume) of a substance to the density of a given reference material.\" wikipedia")
		(type FLOAT)
		(range 0.9 1.1)
		(default 1.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot %3ANAME
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot solubility
;+		(comment "\"Water is a bent, polar compound and possesses the ability to Hydrogen bond. As a result, it has unique solubility characteristics as a solvent and functions differently at different temperatures.\"\nwikpedia.org")
		(type SYMBOL)
		(allowed-values soluble insoluble)
		(default soluble)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pH
;+		(comment "\"pH is a measure of the acidity or basicity of an aqueous solution. Pure water is said to be neutral\"\nwikipedia.org")
		(type FLOAT)
		(range 0.0 14.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
 	(single-slot explosive
;+		(comment "\"explosive, is a reactive substance that contains a great amount of potential energy that can produce an explosion if released suddenly, usually accompanied by the production of light, heat, sound, and pressure.\"\nwikipedia.org")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
        (single-slot suspect 
		(type SYMBOL) 
		(allowed-symbols yes no)
		(default no)))

(defclass Acid "\"An acid (from the Latin acidus is a substance which reacts with a base. Commonly, acids can be identified as tasting sour, reacting with metals such as calcium, and bases like sodium carbonate. Aqueous acids have a pH of less than 7, where an acid of lower pH is typically stronger, and turn blue litmus paper red.\"\nwikipedia.org"
	(is-a ChemicalCompound)
	(role abstract)
	(single-slot pH
;+		(comment "\"pH is a measure of the acidity or basicity of an aqueous solution. Pure water is said to be neutral\"\nwikipedia.org")
		(type FLOAT)
		(range 0.0 5.99999)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass StrongAcid "\"A strong acid is an acid that ionizes completely in an aqueous solution by losing one proton\"\nwikipedia.org"
	(is-a Acid)
	(role concrete)
	(pattern-match reactive)
	(single-slot corrosive
;+		(comment "\"A corrosive substance is one that will destroy or irreversibly damage another surface or substance with which it comes into contact. \"\nwikipedia.org")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
                (default TRUE)
;+		(value TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pH
;+		(comment "\"pH is a measure of the acidity or basicity of an aqueous solution. Pure water is said to be neutral\"\nwikipedia.org")
		(type FLOAT)
		(range 0.0 2.9999)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass WeakAcid "\"A strong base is a basic chemical compound that is able to deprotonate very weak acids in an acid-base reaction.\"\nwikipedia.org"
	(is-a Acid)
	(role concrete)
	(pattern-match reactive)
	(single-slot corrosive
;+		(comment "\"A corrosive substance is one that will destroy or irreversibly damage another surface or substance with which it comes into contact. \"\nwikipedia.org")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(value FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pH
;+		(comment "\"pH is a measure of the acidity or basicity of an aqueous solution. Pure water is said to be neutral\"\nwikipedia.org")
		(type FLOAT)
		(range 3.0 5.99999)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Base "\"A base in chemistry is a substance that can accept hydrogen ions (protons) or more generally, donate electron pairs. \"\nwikipedia.org"
	(is-a ChemicalCompound)
	(role abstract)
	(single-slot pH
;+		(comment "\"pH is a measure of the acidity or basicity of an aqueous solution. Pure water is said to be neutral\"\nwikipedia.org")
		(type FLOAT)
		(range 8.0 14.0)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass StrongBase
	(is-a Base)
	(role concrete)
	(pattern-match reactive)
	(single-slot corrosive
;+		(comment "\"A corrosive substance is one that will destroy or irreversibly damage another surface or substance with which it comes into contact. \"\nwikipedia.org")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(value TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pH
;+		(comment "\"pH is a measure of the acidity or basicity of an aqueous solution. Pure water is said to be neutral\"\nwikipedia.org")
		(type FLOAT)
		(range 11.0 14.0)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass WeakBase "\"In chemistry, a weak base is a chemical base that does not ionize fully in an aqueous solution.\"\nwikipedia.org"
	(is-a Base)
	(role concrete)
	(pattern-match reactive)
	(single-slot corrosive
;+		(comment "\"A corrosive substance is one that will destroy or irreversibly damage another surface or substance with which it comes into contact. \"\nwikipedia.org")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(value FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pH
;+		(comment "\"pH is a measure of the acidity or basicity of an aqueous solution. Pure water is said to be neutral\"\nwikipedia.org")
		(type FLOAT)
		(range 8.0 10.9999)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Oil "\"An oil is any substance that is liquid at ambient temperatures and does not mix with water but may mix with other oils and organic solvents. This general definition includes vegetable oils, volatile essential oils, petrochemical oils, and synthetic oils.\"\nwikipedia.org"
	(is-a ChemicalCompound)
	(role concrete)
	(pattern-match reactive)
	(single-slot toxicity
;+		(comment "\"Toxicity is the degree to which a substance can damage a living or non-living organisms.\"\nwikipedia.org")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot solubility
;+		(comment "\"Water is a bent, polar compound and possesses the ability to Hydrogen bond. As a result, it has unique solubility characteristics as a solvent and functions differently at different temperatures.\"\nwikpedia.org")
		(type SYMBOL)
		(allowed-values soluble insoluble)
		(default insoluble)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pH
;+		(comment "\"pH is a measure of the acidity or basicity of an aqueous solution. Pure water is said to be neutral\"\nwikipedia.org")
		(type FLOAT)
		(range 6.0 7.999999)
;+		(cardinality 1 1)
		(create-accessor read-write))
)

(defclass Store "Contains substances"
;+	(is-a %3ASYSTEM-CLASS)
        (is-a USER)
	(role concrete)
	(single-slot suspect 
		(type SYMBOL) 
		(allowed-symbols yes no)
		(default no))
	(single-slot store+number
;+		(comment "the number of the warehouse")
		(type INTEGER)
		(range 1 8)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot %3ANAME
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot substance
;+		(comment "substance is an acid, a base or an oil")
		(type INSTANCE)
		(allowed-classes ChemicalCompound)
		(cardinality 2 3)
		(create-accessor read-write)))

(defclass Manhole
;+	(is-a %3ASYSTEM-CLASS)
        (is-a USER)
	(role concrete)
	(single-slot suspect 
		(type SYMBOL) 
		(allowed-symbols yes no)
		(default no))
	(multislot store+%26+manholes
		(type INSTANCE)
		(allowed-classes Store Manhole)
		(create-accessor read-write))
	(single-slot %3ANAME
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

;+(defclass Monitoring+Station
;+	(is-a %3ASYSTEM-CLASS)
;+        (is-a USER)
;+	(role concrete)
;+	(single-slot %3ANAME
;+		(type STRING)
;+		(cardinality 0 1)
;+		(create-accessor read-write))
;+	(multislot manhole
;+		(type INSTANCE)
;+		(allowed-classes Manhole)
;+		(create-accessor read-write)))


;+ pins file

(definstances facts
([Acetic+acid] of  WeakAcid

	(chemical+formula "CH3COOH")
	(chname "Acetic acid")
	(colour none)
	(pH 3.0)
	(radioactivity no)
	(smell vinegar)
	(specific+gravity 1.0)
	(spectroscopy no_results))

([Aluminium+hydroxid] of  WeakBase

	(chemical+formula "Al(OH)3")
	(chname "Aluminium hydroxid")
	(colour white)
	(pH 9.5)
	(radioactivity no)
	(smell none)
	(specific+gravity 1.1)
	(spectroscopy Metal))

([Carbonic+acid] of  WeakAcid

	(chemical+formula "H2CO3")
	(chname "Carbonic acid")
	(colour none)
	(pH 5.7)
	(radioactivity no)
	(smell none)
	(specific+gravity 0.9)  ;+1.0
	(spectroscopy Carbon))

([Chromogen+23] of  WeakBase

	(chname "Chromogen 23")
	(colour red)
	(pH 10.0)
	(radioactivity no)
	(smell none)
	(specific+gravity 0.9)
	(spectroscopy no_results))


([Hydrochloric+acid] of  StrongAcid

	(chemical+formula "HCl")
	(chname "Hydrochloric acid")
	(colour none)
	(pH 2)
	(radioactivity no)
	(smell none)
	(specific+gravity 1.0)
	(spectroscopy no_results))



([Manhole+14] of  Manhole

	(store+%26+manholes 
                [Manhole+12]
                [Manhole+13]))

([Manhole+13] of  Manhole

	(store+%26+manholes
		[Manhole+11]
		[Manhole+08]))

([Manhole+12] of  Manhole

	(store+%26+manholes
		[Manhole+09]
		[Manhole+10]))


([Manhole+11] of  Manhole

	(store+%26+manholes
		[Manhole+06]
		[Manhole+07]))


([Manhole+10] of  Manhole

	(store+%26+manholes
		[Manhole+04]
		[Manhole+05]))


([Manhole+09] of  Manhole

	(store+%26+manholes
		[Manhole+01]
		[Manhole+02]
		[Manhole+03]))


([Manhole+08] of  Manhole

	(store+%26+manholes [store+8]))


([Manhole+07] of  Manhole

	(store+%26+manholes [store+7]))


([Manhole+06] of  Manhole

	(store+%26+manholes [store+6]))


([Manhole+05] of  Manhole

	(store+%26+manholes [store+5]))

([Manhole+04] of  Manhole

	(store+%26+manholes [store+4]))

([Manhole+03] of  Manhole

	(store+%26+manholes [store+3]))

([Manhole+02] of  Manhole

	(store+%26+manholes [store+2]))

([Manhole+01] of  Manhole

	(store+%26+manholes [store+1]))

([Petrol] of  Oil

	(chname "Petrol")
	(colour none)
	(explosive TRUE)
	(pH 7.0)
	(radioactivity no)
	(smell none)
	(specific+gravity 0.9)
	(spectroscopy Carbon))

([Rubidium+hydroxide] of  WeakBase

	(chemical+formula "RbOH")
	(chname "Rubidium hydroxide")
	(colour none)
	(pH 10.0)
	(radioactivity yes)
	(smell none)
	(specific+gravity 1.1)
	(spectroscopy Metal))

([Sodium+hydroxide] of  StrongBase

	(chemical+formula "NaOH")
	(chname "Sodium hydroxide")
	(colour none)
	(pH 14.0)
	(radioactivity no)
	(smell none)
	(specific+gravity 1.0)
	(spectroscopy Natrium))

([store+1] of  Store

	(store+number 1)
	(substance
		[Sulphuric+acid]
		[Petrol]))

([store+2] of  Store

	(store+number 2)
	(substance
		[Hydrochloric+acid]
		[Acetic+acid]))

([store+3] of  Store

	(store+number 3)
	(substance
		[Rubidium+hydroxide]
		[Transformer+oil]))

([store+4] of  Store

	(store+number 4)
	(substance
		[Carbonic+acid]
		[Acetic+acid]
		[Petrol]))

([store+5] of  Store

	(store+number 5)
	(substance
		[Chromogen+23]
		[Sulphuric+acid]
		[Petrol]))

([store+6] of  Store

	(store+number 6)
	(substance
		[Aluminium+hydroxid]
		[Transformer+oil]
		[Carbonic+acid]))

([store+7] of  Store

	(store+number 7)
	(substance
		[Sulphuric+acid]
		[Hydrochloric+acid]))

([store+8] of  Store

	(store+number 8)
	(substance
		[Acetic+acid]
		[Carbonic+acid]
		[Sodium+hydroxide]))

([Sulphuric+acid] of  StrongAcid

	(chemical+formula "H2SO4")
	(chname "Sulphuric acid")
	(colour none)
	(pH 2)
	(radioactivity no)
	(smell none)
	(specific+gravity 1.0)
	(spectroscopy Sulfur))

([Transformer+oil] of  Oil

	(chname "Transformer oil")
	(colour none)
	(pH 7.0)
	(radioactivity no)
	(smell none)
	(specific+gravity 1.0)
	(spectroscopy Carbon)
	(toxicity TRUE))
 )


(deffunction ask-question (?question $?allowed-values)
    (printout t ?question)
    (bind ?answer (read))
    (if (lexemep ?answer)
        then (bind ?answer (lowcase ?answer)))
    (while (not (member ?answer ?allowed-values)) do
           (printout t ?question)
           (bind ?answer (read))
    (if (lexemep ?answer)
         then (bind ?answer (lowcase ?answer))))
          ?answer)






;+ this rule asks the user what measurements is he going to give
;+ and saves the names in the $?answer variable. All measurements should
;+ be given as they appear in the brackets.

(defrule initial-question
	?x <- (initial-fact)
  =>
	(retract ?x)
	(set-strategy breadth)
	(printout t "What measurements are you going to insert? (pH solubility spectrometry colour smell specific_gravity radioactivity)")
	(bind $?answer (explode$ (readline)))
	(assert (measurements $?answer))

)







;+ for each one of the elements in the variable $?answer a rule is being created 

(defrule intit-q2
    	?x<-(measurements $? ?answer $?)
=>
	(assert (goal-get-measurement ?answer ))
)






;+ for each of the measurements the user must assert their values
;+ the fact that is being asserted in the fact list looks like
;+ (answer measurement value)
;+ acceptable values only those in the brackets.

(defrule get-measuremenet-pH
     ?x       <- (goal-get-measurement pH)
=>
     (retract ?x)
     (printout t "What is the pH? (0 - 14) ")
     (bind ?answerph (explode$ (readline)))
     (assert (answer pH ?answerph))
     (assert (step-to initializing))
)

(defrule get-measuremenet-solubility
     ?x       <- (goal-get-measurement solubility)
=>
     (retract ?x)
     (printout t "What is the solubility? (soluble, insoluble) ")
     (bind ?answersolubility (explode$ (readline)))
     (assert (answer solubility ?answersolubility))
     (assert (step-to initializing))
)



(defrule get-measuremenet-spectrometry
     ?x       <- (goal-get-measurement spectrometry)
=>
     (retract ?x)
     (printout t "What does the spectrometry show? (no_results, Sulphur, Carbon, Sodium, Metal)")
     (bind ?answerspec (explode$ (readline)))
     (assert (answer spectrometry ?answerspec))
     (assert (step-to initializing))
)

(defrule get-measuremenet-colour
     ?x       <- (goal-get-measurement colour)
=>
     (retract ?x)
     (printout t "What is the color of the leakage? (red, white, none) ")
     (bind ?answercolour (explode$ (readline)))
     (assert (answer colour ?answercolour))
     (assert (step-to initializing))
)


(defrule get-measuremenet-smell
     ?x       <- (goal-get-measurement smell)
=>
     (retract ?x)
     (printout t "What does it smell like? (choking, vinegar, none) ")
     (bind ?answersmell (explode$ (readline)))
     (assert (answer smell ?answersmell))
     (assert (step-to initializing))
)


(defrule get-measuremenet-specific_gravity
     ?x       <- (goal-get-measurement specific_gravity)
=>
     (retract ?x)
     (printout t "What is the specific gravity? (0.9 - 1.1) ")
     (bind ?answerspecific_gravity (explode$ (readline)))
     (assert (answer specific_gravity ?answerspecific_gravity))
     (assert (step-to initializing))
)

(defrule get-measuremenet-radioactivity
     ?x       <- (goal-get-measurement radioactivity)
=>
     (retract ?x)
     (printout t "Is it radioactive? (yes, no)")
     (bind ?answerrad(explode$ (readline)))
     (assert (answer radioactivity ?answerrad))
     (assert (step-to initializing))
)



;+ Here begins the incrimination procedure of the chemical compounds.
;+ Set-strategy to complexity in order to perform the rules in the appropriate order

(defrule finish-measurements
    ?x<- (step-to initializing)
=>
   (retract ?x)
;+ (printout t "Initializing suspects...")
   (set-strategy complexity)
   (assert(goal init-sus-pH))

)




;+ If a Chemical Compound has a property similar to the measurement
;+ It is being declared as a suspect and the fact is being removed by the fact list

(defrule init-ph
     (goal init-sus-pH)
     (answer pH ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (pH ?value2)
             (suspect no))
     (test (eq ?value ?value2))
 =>
    (modify-instance ?c
            (suspect yes))
)

(defrule init-ph2
    ?x1<-(goal init-sus-pH)
=>
    (retract ?x1)
    (assert (goal init-sus-sol))
)

(defrule init-solub
     (goal init-sus-sol)
     (answer solubility ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (solubility ?value2)
             (suspect no))
     (test(eq ?value ?value2))
 =>
     (modify-instance ?c
             (suspect yes))
)

(defrule init-solub2
    ?x1<-(goal init-sus-sol)
 => 
    (retract ?x1)
    (assert (goal init-sus-spec))
)


(defrule init-spec
     (goal init-sus-spec)
     (answer spectrometry ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (spectroscopy ?value2)
             (suspect no))
             (test(eq ?value ?value2))
 => 
;+   (printout t "name: " ?c)
     (modify-instance ?c
             (suspect yes))
)

(defrule init-spec2
    ?x1<-(goal init-sus-spec)
 => 
    (retract ?x1)
    (assert (goal init-sus-colour))
)

(defrule init-colour
     (goal init-sus-colour)
     (answer colour ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (colour ?value2)
             (suspect no))
     (test(eq ?value ?value2))
 =>
     (modify-instance ?c
             (suspect yes))
)

(defrule init-colour2
    ?x1<-(goal init-sus-colour)
 => 
    (retract ?x1)
    (assert (goal init-sus-smell))
)

(defrule init-smell
     (goal init-sus-smell)
     (answer smell ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (smell ?value2)
             (suspect no))
     (test(eq ?value ?value2))
 =>
     (modify-instance ?c
             (suspect yes))
)

(defrule init-smell2
    ?x1<-(goal init-sus-smell)
   =>
    (retract ?x1)
    (assert (goal init-sus-SG))
)


(defrule init-SG
     (goal init-sus-SG)
     (answer specific_gravity ?value)
     (object (is-a ChemicalCompound)
             (name ?c) 
             (specific+gravity ?value2)
             (suspect no))
     (test(eq ?value ?value2))
 =>
     (modify-instance ?c
             (suspect yes))
)



(defrule init-SG2
    ?x1<-(goal init-sus-SG)
   =>
    (retract ?x1)
    (assert (goal init-sus-rad))
)


(defrule init-rad
     (goal init-sus-rad)
     (answer radioactivity ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (radioactivity ?value2)
             (suspect no))
     (test(eq ?value ?value2))
 =>
     (modify-instance ?c
             (suspect yes))
;+     (printout t "Is the Chemical Compound, " ?c ", radioactive?")
)

(defrule init-rad2
    ?x1<-(goal init-sus-rad)
   =>
    (retract ?x1)
    (assert (goal init-dec-pH))
)





;+ Here being the decriminilizing procedure of the Chemical Compounds
;+ Similar to the Incrimination for each and everyone of the facts
;+ If a Chemical Compound is a suspect and it's property value is different that the measurement
;+ Then it is no longer a suspect.

(defrule init-decriminilize-pH
     (goal init-dec-pH)
     (answer pH ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (pH ?value2)
             (suspect yes))
     (test(neq ?value ?value2))              
  
=>
;+  (printout t "Does the Chemical Compound, " ?c ", have pH equal to " ?value2 " ")
     (modify-instance ?c
            (suspect no))
)


(defrule init-dec-pH2
    ?x1<-(goal init-dec-pH)
   =>
    (retract ?x1)
    (assert (goal init-dec-sol))
)



(defrule init-decriminilize-sol
     (goal init-dec-sol)
     (answer solubility ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (solubility ?value2)
             (suspect yes))
     (test(neq ?value ?value2))
=>
;+     (printout t " S " )
     (modify-instance ?c
             (suspect no))
)

(defrule init-dec-sol2
    ?x1<-(goal init-dec-sol)
   =>
    (retract ?x1)
    (assert (goal init-dec-spec))
)

(defrule init-decriminilize-spec
     (goal init-dec-spec)
     (answer spectometry ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (spectroscopy ?value2)
             (suspect yes))
     (test(neq ?value ?value2))
=>
     (modify-instance ?c
             (suspect no))
)

(defrule init-dec-spec2
    ?x1<-(goal init-dec-spec)
   =>
    (retract ?x1)
    (assert (goal init-dec-col))
)

(defrule init-decriminilize-col
     (goal init-dec-colour)
     (answer colour ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (colour ?value2)
             (suspect yes))
     (test(neq ?value ?value2))
=>
     (modify-instance ?c
             (suspect no))
)

(defrule init-dec-col2
    ?x1<-(goal init-dec-col)
   =>
    (retract ?x1)
    (assert (goal init-dec-smell))
)

(defrule init-decriminilize-smell
     (goal init-dec-smell)
     (answer smell ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (smell ?value2)
             (suspect yes))
     (test(neq ?value ?value2))
=>
;+   (printout t "Does the Chemical Compound, " ?c ", smell like " ?value2 "? ")
     (modify-instance ?c
             (suspect no))
)

(defrule init-dec-smell2
    ?x1<-(goal init-dec-smell)
   =>
    (retract ?x1)
    (assert (goal init-dec-SG))
)

(defrule init-decriminilize-SG
     (goal init-dec-SG)
     (answer specific_gravity ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (specific+gravity ?value2)
             (suspect yes))
     (test(neq ?value ?value2))
=>
     (modify-instance ?c
             (suspect no))
)

(defrule init-dec-SG2
    ?x1<-(goal init-dec-SG)
   =>
    (retract ?x1)
    (assert (goal init-dec-rad))
)

(defrule init-decriminilize-rad
     (goal init-dec-rad)
     (answer radioactivity ?value)
     (object (is-a ChemicalCompound)
             (name ?c)
             (radioactivity ?value2)
             (suspect yes))
     (test(neq ?value ?value2))
=>
;+ (printout t "Is the Chemical Compound, " ?c ", radioactive?" )     
     (modify-instance ?c
             (suspect no))
)



(defrule init-dec-rad2
    ?x1<-(goal init-dec-rad)
   =>
    (retract ?x1)
    (assert (move on))
)






;+ Here beings the incrimination of the Storages.
;+ If a suspect Chemical Compound exists in a Storage,
;+ Then the storage becomes a suspect.

(defrule sus-store 
       (move on)
       (object (is-a ChemicalCompound)
               (suspect yes)
               (name ?nam))
       (object (is-a Store)
               (name ?c)
               (substance $? ?nam $?)
               (suspect no))
       =>
       (modify-instance ?c 
               (suspect yes))
;+     (printout t "The Store " ?c " contains the Chemical Compound" ?nam "  "  crlf)
)


;+ Move into the next rule

(defrule sus-store2
    ?x1<-(move on)
 =>
    (retract ?x1)
    (assert (goal finish-sus))
)





;+ If there more than one suspect Storages,
;+ Then the incrimination procedure of the Manholes begins.

(defrule finished-sus
      ?x1<-(goal finish-sus)
      (object (is-a Store)
              (suspect yes)
              (name ?c))
      (object (is-a Store)
              (suspect yes)
              (name ?c2&~?c))
=>
     (retract ?x1)
     (assert (goal initiate-manhole))
)





;+ If there is only one suspect Storage,
;+ Then the program prints the results.
 
(defrule finish-print
     ?x1<-(goal finish-sus)
   =>
     (retract ?x1)
     (assert (goal print))
)





;+ Initially the Manholes connected directly to the Suspect Storages become suspects,

(defrule initiate-manholes
      (goal initiate-manhole)
      (object (is-a Manhole)
	      (name ?c2)
              (store+%26+manholes ?c)
              (suspect no))
      (object (is-a Store)
              (name ?c)
              (suspect yes))
=>
;+   (printout t "The Manhole " ?c2 " is connected to the Store "  ?c crlf)
     (modify-instance ?c2
             (suspect yes))
)


;+ Transition

(defrule con-manh
    ?x1<-(goal initiate-manhole)
=>
    (retract ?x1)
    (assert (goal continue-manholes))
;+  (printout t "i am here" )
)





;+ If there are Manholes that are connected to Suspect Manholes,
;+ Then the Manhole becomes a suspect.
;+ Runs for all Manholes

(defrule continue-manholes
      (goal continue-manholes)
      (object (is-a Manhole)
              (name ?c)
              (suspect yes))
      (object (is-a Manhole)
              (name ?c2)
              (suspect no)
              (store+%26+manholes $? ?c $?))
 => 
;+   (printout t "The Manhole " ?c2 " is connected to the Manhole "  ?c crlf)
     (modify-instance ?c2
                (suspect yes))

)




;+ Transition
;+ Change of strategy
(defrule con-leak
    ?x1<-(goal continue-manholes)
    =>
     (retract ?x1)
     (set-strategy mea)
     (assert (goal find-leak))
)






;+ If a Manhole is connected with 2 different Suspect Manholes then
;+ The program asks for one of them, if it is a suspect,
;+ The corresponding non-suspect Manhole is decriminilized.
;+ We assume only one Storage is leaking.

(defrule find-leak
       (goal find-leak)
       (object (is-a Manhole)
               (name ?c)
               (suspect yes)
               (store+%26+manholes $? ?c2 $? ?c3 $? )) 
       (object (is-a Manhole)
               (name ?c2)
               (suspect yes))
       (object (is-a Manhole)
               (name ?c3&~?c2)
               (suspect yes))
=>
       (printout t "Does the Manhole, " ?c3 ", have a leakage? " )
       (bind ?diaroi (ask-question " " yes no))
       (if(eq ?diaroi no)
            then  (assert (decriminalize ?c3))
            else  (assert (decriminalize ?c2)))
)




;+ This rule decriminalizes the above Manholes.

(defrule decriminalize-this-manhole
     (decriminalize ?manhole)
     (object (is-a Manhole)
             (name ?manhole)
             (suspect yes))
 =>
    (modify-instance ?manhole 
             (suspect no))
    (assert (goal decriminalize-rest-manholes))
)



;+ If there exists a Manhole that is not a suspect ?c2 and,
;+ It is connected to a Manhole that is a suspect ?c,
;+ Then ?c is not a suspect.

(defrule decriminalize-rest-manholes
     (goal decriminalize-rest-manholes)
     (object (is-a Manhole)
              (name ?c)
              (suspect yes))
     (object (is-a Manhole)
              (name ?c2)
              (suspect no)
              (store+%26+manholes $? ?c $?))
=>
     (modify-instance ?c
             (suspect no))
)







;+ Transition

(defrule continue-dec
     ?x1<-(goal decriminalize-rest-manholes)
=>
       (retract ?x1)
       (assert (goal dec-store))
)





;+ Decriminalizing of the Storages that a connected to a non-Suspect Manhole.

(defrule decriminalize-store
     (goal dec-store)
     (object (is-a Manhole)
             (name ?c)
             (store+%26+manholes ?c2)
             (suspect no))
     (object (is-a Store)
             (name ?c2)
             (suspect yes))
=>
     (modify-instance ?c2
            (suspect no))
   
)





;+ Re-run find leak

(defrule continue
     ?x1<-(goal dec-store)
  =>
    (retract ?x1)
    (assert (goal find-leak))
)





;+ If there is a Store that is a Suspect,
;+ and there is no other Store which is a Suspect,
;+ Then print the resulting Suspect Storage.

(defrule finish
   (goal find-leak)
   (object (is-a Store) 
        (name ?c)
        (suspect yes))
   (not (and
            (object (is-a Store)
                   (name ?c2&~?c)
               (suspect ?suspect))
       ( test (eq ?suspect yes))))
   
=>
   (assert (goal print))
)






;+ Prints the results, containing the Suspect Storage and the Chemical Compounds.

(defrule sdfasdf
      (goal print)
      (object (is-a Store)
              (name ?c)
              (substance $? ?s $?)              
              (suspect yes))
      (object (is-a ChemicalCompound)
              (name ?s)
              (chname ?s1)
              (suspect yes)
 ;+             (explosive ?exp)
 ;+             (corrosive ?cor)
              
              )
=>
      (modify-instance ?s
              (suspect no))
      (printout t "The Storage  " ?c "  has a leakasge of the Chemical Compound: " ?s1 crlf)
 ;+     (if(eq ?exp TRUE)
 ;+      then (printout t "Potenial Danger:  explosive " crlf ))
 ;+     (if(eq ?cor TRUE)
 ;+      then (printout t "Potenial Danger: burn skin " crlf ))
            
)




;+ extra print function stating the potential dangers.

(defrule sdfasdf2
      (goal print)
      (object (is-a Store)
              (name ?c)
              (substance $? ?s $?)              
              (suspect yes))
      (object (is-a ChemicalCompound)
              (name ?s)
              (chname ?s1)
              (suspect yes)
              (explosive ?exp)
              (corrosive ?cor)
              
              )
=>
      (modify-instance ?s
              (suspect no))
      (printout t "The Storage " ?c " has a leakasge of the Chemical Compound: " ?s1 crlf)
      (if(eq ?exp TRUE)
       then (printout t "Potenial Danger:  explosive " crlf ))
      (if(eq ?cor TRUE)
       then (printout t "Potenial Danger: burn skin " crlf ))
            
)