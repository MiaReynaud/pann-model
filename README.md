# pann-model

## How to install it

To install this model into a fresh Pharo image open the Playground (Ctrl+OP) and execute the following Metacello script (select it and press Do-it all button or Ctrl+D). If you already have Cormas installed, then simly execute the second half of the script.

```st
"Install Cormas"
Metacello new
    repository: 'github://cormas/cormas';
    baseline: 'Cormas';
    load.

"Install this model"
Metacello new
    baseline: 'FemmesEtCoquillages';
    repository: 'github://MiaReynaud/pann-model:main';
    load
```
