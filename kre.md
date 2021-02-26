
# Table of Contents

1.  [Info](#orgd9503f4)
2.  [Introduction and Concepts](#orga2ef3bd)
    1.  [Introduction](#org1ee3acb)
    2.  [Data, Information, and Knowledge](#org996ec69)
    3.  [Types and Uses of Knowledge](#orge12ebde)
    4.  [Knowledge Representation](#orge998787)
    5.  [Knowledge Engineering](#orgb1b7358)
    6.  [Syntax ans Semantics](#org61b989c)
    7.  [Conclusions](#orgd5ef229)
    8.  [Exercises](#org083b094)
3.  [Knowledge Representation](#org083cad5)
    1.  [First Order Logic](#org5931b62)
    2.  [Rules and Production Systems](#org92aef9f)
    3.  [Object Oriented Representation](#org9bc460a)
    4.  [Network Representation](#orgf5e7792)
    5.  [Ontologies](#org105c63c)
4.  [Knowledge Engineering](#orge759cbd)
    1.  [Knowledge Life Cycle](#org06750f1)
    2.  [Knowledge Auditing](#orgf9d7080)
    3.  [Knowledge Deployment](#org8a56110)
    4.  [Knowledge Acquisition](#org2f4b20b)
5.  [Knowledge Representation in the Web](#org84c47d0)



<a id="orgd9503f4"></a>

# Info


<a id="orga2ef3bd"></a>

# IN-PROGRESS Introduction and Concepts


<a id="org1ee3acb"></a>

## DONE Introduction

We introduce two different areas dealing with &ldquo;knowledge&rdquo;

-   **Knowledge Representation:** Artificial Intelligence area concerned with how to represent and manipulate knowledge in an automated way.

-   **Knowledge Engineering:** Computer Engineering area concerned with procedures and methods helping developers to systematically and formally construct knowledge bases.

A generic knowledge-based system deals with an input \(I\) and an output \(O=f(I,K)\)

-   e.g. \(I=\text{Symptoms}, K=\text{Medical knowledge}, O=\text{Drug}\)
-   The knowledge is provided by a **knowledgebase**
-   The system behaves in an **intelligent** way

But why should we use a knowledgebase instead of a database? Consider a database having the following tables:

-   `PERSONS` table

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Id</th>
<th scope="col" class="org-left">Name</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">A</td>
<td class="org-left">Albert</td>
</tr>


<tr>
<td class="org-left">B</td>
<td class="org-left">Beth</td>
</tr>


<tr>
<td class="org-left">C</td>
<td class="org-left">Cindy</td>
</tr>


<tr>
<td class="org-left">&#x2026;</td>
<td class="org-left">&#x2026;</td>
</tr>
</tbody>
</table>

-   `PARENTSHIPS` table

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">X</th>
<th scope="col" class="org-left">Y</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">A</td>
<td class="org-left">B</td>
</tr>


<tr>
<td class="org-left">B</td>
<td class="org-left">C</td>
</tr>


<tr>
<td class="org-left">B</td>
<td class="org-left">D</td>
</tr>


<tr>
<td class="org-left">&#x2026;</td>
<td class="org-left">&#x2026;</td>
</tr>
</tbody>
</table>

We can ask the following questions

-   Is `A` a parent of `B`?
    -   `SELECT X FROM PARENTSHIPS WHERE X="A",Y="B";`
-   Who are the parents of `B`?
    -   `SELECT X FROM PARENTSHIPS WHERE Y="B";`
-   Who are the sons of `A`?
    -   `SELECT X FROM PARENTSHIPS WHERE Y="B";`
-   Who are the ancestors?
    -   With a table of `ANCESTORS`
        -   With \(n\) people, `ANCESTORS` is in \(O(n^2)\)
        -   If \(1\) generation has (on average) \(2.36\) ancestors, then \(20\) generations have \(28.7\) million ancestors
    -   With some explicit &ldquo;knowledge&rdquo; (e.g. intelligence)
        -   `ANCESTOR`
            -   If `X` is a parent of `Y` then `X` is an ancestor of `Y`
            -   If `X` is an ancestor of `Z` and `Z` is a parent of `Y` then `X` is an ancestor of `Y`
        -   We can rely on this knowledge base to answer the question

                if PARENT(X,Y) then return true;
                else
                 search Z: PARENT(Z,Y)
                 if Z does not exist then return false;
                 else
                  return Ancestor(X,Z.father) or Ancestor(X,Z.mother);

-   **Decision Support Systems:** Computer systems helping users to make decisions in complex domains


<a id="org996ec69"></a>

## DONE Data, Information, and Knowledge

-   **Data:** Raw and without context, it simply exists in its form (either usable or not)
-   **Information:** Data + Meaning, it can change the perception of the receiver about something
    -   **Meanings:** The five C&rsquo;s of Davenport&Prusak describe what can give meaning to data
        -   **Contextualization:** Purpose of data
        -   **Categorization:** Classified or generalization to concepts
        -   **Calculation:** Mathematical or statistical analysis
        -   **Correction:** Removal of erros
        -   **Condensation:** Removal of unnecessary elements
-   **Knowledge:** Information + &ldquo;something&rdquo;, generalized to increase applicability. What is &ldquo;something&rdquo;?
    -   The four C&rsquo;s of Davenport&Prusak describe what &ldquo;something&rdquo; can be
        -   **Comparison:** Similarity to other contexts
        -   **Consequence:** Implication in decision taking
        -   **Connection:** Relationship with other information
        -   **Conversation:** Feedback of people
    -   **Tobin:** &ldquo;Something&rdquo; = Application

-   **Wisdom:** Knowledge + Intuition + Experience
-   **Expertise:** Wisdom + Selection + Principles + Constrains + Learning
-   **Capability:** Expertise + Integration + Distribution + Navigation


<a id="orge12ebde"></a>

## TODO Types and Uses of Knowledge


<a id="orge998787"></a>

## TODO Knowledge Representation


<a id="orgb1b7358"></a>

## TODO Knowledge Engineering


<a id="org61b989c"></a>

## TODO Syntax ans Semantics


<a id="orgd5ef229"></a>

## Conclusions


<a id="org083b094"></a>

## [Exercises](exercises.md)


<a id="org083cad5"></a>

# Knowledge Representation


<a id="org5931b62"></a>

## TODO First Order Logic


<a id="org92aef9f"></a>

## Rules and Production Systems


<a id="org9bc460a"></a>

## Object Oriented Representation


<a id="orgf5e7792"></a>

## Network Representation


<a id="org105c63c"></a>

## Ontologies


<a id="orge759cbd"></a>

# Knowledge Engineering


<a id="org06750f1"></a>

## Knowledge Life Cycle


<a id="orgf9d7080"></a>

## Knowledge Auditing


<a id="org8a56110"></a>

## Knowledge Deployment


<a id="org2f4b20b"></a>

## Knowledge Acquisition


<a id="org84c47d0"></a>

# Knowledge Representation in the Web
