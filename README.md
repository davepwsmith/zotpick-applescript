# zotpick-applescript

Leverage [Better-BibTeX's citation picker](https://zotplus.github.io/better-bibtex/cayw.html) in your word-processing app.

These three scripts allow you to use [Better BibTeX's citation picker](https://zotplus.github.io/better-bibtex/cayw.html) 
with any word-processing app. The three applets (available compiled in the Releases section) correspond to the three available citation ouputs: pandoc-formatted citations, MultiMarkdown-formatted citations, and Scannable Cites 
(for [RTF/ODF Scan for Zotero](http://zotero-odf-scan.github.io/zotero-odf-scan/)).

## Basic usage

When you run one of the scripts, Zotero (which must already be open and have Better BibTeX installed) will appear and open a search box where you can search for the desired citation. Suffixes, prefixes, page numbers and author suppression can be set by clicking the selected citation in the search box and filling out the options, but these do *not* work in MultiMarkdown output. The resultant citation text will then be entered into the app you were working in when you ran the script. Since the script is basically typing the citation into your application, it should work with any word processor (and any others that accept text input as well).

Please report any errors as issues on the [GitHub page](https://github.com/davepwsmith/zotpick-applescript).

---

## With Scrivener
Set one of the applets as your reference manager in Scrivener, call up with ⌘-Y.

These applets work well in conjunction with this workflow for using [Scrivner, Pandoc, Zotero and Marked 2 for academic writing](http://davepwsmith.github.io/academic-scrivener-howto/).

## With other Apps

One way to use these scripts with any application is to put them in your ~/Library/Scripts folder. Or to use them with one specific app, put them inside a folder with that app's name inside the Scripts folder. If you use a utility that lets you assign key combos to apps, use that to launch these scripts.