+ [Motivation for OOP](OOPGoals.xml)
+ [The setIs() mechanism](setIs.xml)


Also see the DSI workshop on OOP in R at [ROOPWorkshop](https://github.com/dsidavis/ROOPWorkshop).


The XML documents can be "run" in R with 
```
xmlSource("setIs.xml")
```
to run the R code they contain.

One can also convert them to HTML, LaTeX, PDF using the [XDynDocs facilities](https://github.com/duncantl/XDynDocs)
See the (GNUmakefile) in this directory.





# XDynDocs

+ Download and unzip [docbook-xsl](https://sourceforge.net/projects/docbook/files/#files). Your home
  directory is a good place.
+ Create a symbol link from docbook-xsl-1.79.1 to docbook-xsl-current

+ Install the R package [XDynDocs](https://github.com/duncantl/XDynDocs).  The configuration 
  step creates catalog.xml and Makefile in subdirectories of inst/ and also installs them with the
  R package.
  
+ Set the environment XML_CATALOG_FILE to the relevant catalog.xml file. I put mine in `$HOME`.

+ Edit the catalog.xml appropriately to change the rewrite to point to where the docbook-xsl-current
  directory is. The relevant parts of my catalog.xml file look like:
```  
...
<rewriteURI uriStartString="http://www.omegahat.org/XSL/" rewritePrefix="/Users/duncan/GitWorkingArea/XDynDocs/inst/XSL/OmegahatXSL/" />
<rewriteURI uriStartString="http://www.omegahat.org/XDynDocs/XSL/" rewritePrefix="/Users/duncan/GitWorkingArea/XDynDocs/inst/XSL/" />
<rewriteURI uriStartString="http://www.omegahat.org/XDynDocs/" rewritePrefix="/Users/duncan/GitWorkingArea/XDynDocs/inst/" />
<rewriteURI uriStartString="http://docbook.sourceforge.net/release/xsl/current/" rewritePrefix="/Users/duncan/docbook-xsl-current/" />
<rewriteURI uriStartString="http://dblatex.sourceforge.net/" rewritePrefix="/Users/duncan/dblatex-current/" />
...
```
+ These redirect to the local git repository where the XDynDocs is, i.e.,  `/Users/duncan/GitWorkingArea/XDynDocs`
  And since this is not installed, I point to the inst/ directory within this to find the
  different configured files.
+ If you want to use the installed versions of these files within the installed R packages, then
  point to wherever you install the R package, but don't include the inst/ directory.
