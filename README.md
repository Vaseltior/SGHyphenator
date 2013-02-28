SGHyphenator
============

SGHyphenator is a text hyphenation class for Objective-C.

## How to use it

Considering the word "attention", using an hyphenation system will return the following split :

* at
* ten
* tion

This means the word can be split like this *at-ten-tion*. So if the text is not justified, and the word reach the rightmost limit of the screen or the page so that it couldn't be drawn completely, you could give a try with the following words :

* at-
* atten-
* attention

##### Justified text without hyphenation

```
We,       therefore,      the
representatives of the United
States of America...
```

##### Justified text with hyphenation

```
We, therefore, the represen-
tatives of the United States
of America...
```

Starting the new line with the remaining not used part of the word.

Now, if you want to use it :

```
// Call the singleton, and ask for the french pattern to be loaded
[[SGHyphenator sharedInstance] setPatternFile:@"hyphens_fr"];

// Hyphenate a word
NSArray * hyphenatedList = [[SGHyphenator sharedInstance] hyphenate:@"attention"];

```

## Current languages

Contains hyphen files for the following languages :

* French (hyphens_fr)
* English (TBA)