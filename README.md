# CKY Parser

## Project Website

- [https://abhijeetchopra.github.io/CKY-Parser/](https://abhijeetchopra.github.io/CKY-Parser/)

## Project Goal

- Use the CKY parsing algorithm (alternatively called CYK parsing algorithm) to parse a particular input string and check whether it is derivable by the grammar or not.

## Project Description

- Context Free Grammar(CFG) is converted into Chomsky Normal Form Grammar(CNFG).
- CNFG so obtained is fed into the CKY parsing algorithm

## Assumptions

- The CFG used in the project is described in the section below. Any other CFG can also be used.
- Conversion of CFG to CNFG is done manually. The program recognizes and accepts only CNFG and not CFG directly.
- The program employs the lower-triangular form of the CKY parsing matrix. Both upper-triangular and lower-triangular matrix form yield the same answers.

## CFG

` S -> NP VP  `  
` S -> VP  `  
` NP -> Pronoun  `  
` NP -> Proper Noun  `  
` Nominal -> Noun  `  
` Nominal -> Nominal Noun  `  
` Nominal -> Nominal PP  `  
` VP -> Verb  `  
` VP -> Verb NP  `  
` VP -> Verb NP PP  `  
` VP -> Verb PP  `  
` VP -> VP PP  `  
` PP -> Preposition NP  `  

## Lexicon

` Det -> The | the | a | the | send | reached | seven | they  `  
` Noun -> parcel | weight | beautiful | document | feasible | discount | warehouse | for | away | location | belonged | little | beds  `  
` Verb -> was | gave | gives | told | thought | slowly | found  `  
` Pronoun -> There | it | he | the | expensive  `  
` Proper Noun -> Snow-White | goods | heavy | big |cheap | timely | children  `  
` Preposition -> in | named | and | to | into  `  

## CNFG

` S -> NP VP  `  
` S -> Verb NP  `  
` S -> X2 PP  `  
` S -> Verb PP  `  
` S -> VP PP  `  
` S -> was  `  
` S -> gave  `  
` S -> gives  `  
` S -> told  `  
` S -> slowly  `  
` S -> found  `  
` S -> thought  `  
` S -> ordered  `  
` NP -> There  `  
` NP -> It  `  
` NP -> big  `  
` NP -> cheap  `  
` NP -> goods  `  
` NP -> He  `  
` NP -> the  `  
` NP -> her  `  
` NP -> timely  `  
` NP -> expensive  `  
` NP -> children  `  
` NP -> FedEx  `  
` NP -> heavy  `  
` NP -> Det Nominal  `  
` Nominal -> Nominal Noun  `  
` Nominal -> Nominal PP  `  
` Nominal -> beautiful  `  
` Nominal -> feasible  `  
` Nominal -> parcel  `  
` Nominal -> weight  `  
` Nominal -> far  `  
` Nominal -> location  `  
` Nominal -> little  `  
` Nominal -> belonged  `  
` Nominal -> envelope  `  
` Nominal -> important  `  
` Nominal -> warehouse  `  
` VP -> was  `  
` VP -> gave  `  
` VP -> gives  `  
` VP -> told  `  
` VP -> slowly  `  
` VP -> found  `  
` VP -> thought  `  
` VP -> ordered  `  
` VP -> Verb NP  `  
` VP -> X2 PP  `  
` X2 -> Verb NP  `  
` VP -> Verb PP  `  
` VP -> VP PP  `  
` PP -> Preposition NP  `  
` Verb -> was  `  
` Verb -> gave  `  
` Verb -> gives  `  
` Verb -> told  `  
` Verb -> slowly  `  
` Verb -> found  `  
` Verb -> thought  `  
` Verb -> ordered  `  
` Det -> a  `  
` Det -> The  `  
` Det -> the  `  
` Det -> her  `  
` Det -> send  `  
` Det -> reached  `  
` Det -> seven  `  
` Det -> they  `  
` Noun -> document  `  
` Noun -> discount  `  
` Noun -> away  `  
` Noun -> beds  `  
` Noun -> beautiful  `  
` Noun -> feasible  `  
` Noun -> parcel  `  
` Noun -> weight  `  
` Noun -> far  `  
` Noun -> location  `  
` Noun -> little  `  
` Noun -> belonged  `  
` Noun -> envelope  `  
` Noun -> important  `  
` Noun -> warehouse  `  
` Preposition -> named  `  
` Preposition -> and  `  
` Preposition -> in  `  
` Preposition -> into  `  
` Preposition -> to  `  
` Preposition -> send  `  

## Future Scope

- Write documentation to use the program including clear instructions for users on how to specify grammar in the program input box / textarea with proper syntax rules.
- Add functionality in program to do automatic conversion of CFG to CNFG. The program should be able to recognize and accept both CNFG and CFG.
- Ask user to specify which triangular form to use to generate the CKY parsing matrix. The program should be able to employ both the lower-triangular and upper-triangular form of the CKY parsing matrix.

## References

### 1. Original parser

Author: Martin Lazarov  
Year published: 2017  
Page title: CKY parsing algorithm demo   
URL: http://lxmls.it.pt/2015/cky.html  
Access date: 03 May 2017  

### 2. Webpage Template

Author: David Miller  
Year published: 2013  
Page title: Freelancer - Start Bootstrap Theme   
URL: https://blackrockdigital.github.io/startbootstrap-freelancer/  

### 3. Lion Head Logo

Page title: Tamuc.edu  
URL: http://www.tamuc.edu/facultyStaffServices/marketingCommunications/standards/logos/documents/2013-Lion-Head.png  
