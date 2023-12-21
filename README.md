# ML_lexicon_spanish_NLP
In the context of my research, I became interested in sentiment analysis. While in English, we have plenty of dictionaries for conducting analyses, unfortunately, in Spanish, it is more challenging to find usable resources in R. One day, I came across an article by Fermín L. Cruz, José A. Troyano, Beatriz Pontes, and F. Javier Ortega in which they propose a lexicon. 

This small program will allow you to import their dictionary into R and use it. I also provide a small example of using the dictionary with a dataset of tweets that I downloaded when we had access to Twitter data.

You can find the file with the lexicon here: http://www.lsi.us.es/~fermin/index.php?title=Datasets

Reference for the lexicon:
Fermín L. Cruz, José A. Troyano, Beatriz Pontes, and F. Javier Ortega. 'Building layered, multilingual sentiment lexicons at synset and lemma levels,' Expert Systems with Applications, Volume 41, Issue 13, 2014, Pages 5984-5994, https://doi.org/10.1016/j.eswa.2014.04.005.
(https://www.sciencedirect.com/science/article/pii/S0957417414001997)

## File: ML_lexicon
This file contains commands to transform the .xml file into a dictionary usable in R. It is divided into 5 steps. In the end, you will find an object 'sentiments_dico_esp.' You can use this object with the tokens_lookup function from the quanteda package.

