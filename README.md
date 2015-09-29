HTML Entities Helper for Vim
============================

A couple of handy search-and-replace functions for Vim that: -

* convert unicode characters to their repspective named HTML entities
* convert named HTML entities to their unicode codepoint equivalents

Changelog
---------
* 1.1 - Support for operating over ranges (thanks to [Nahuel Soldevilla](https://github.com/solde9))
* 1.0 - Initial Version

Installation
------------
Save yourself a lot of hassle and install Tim Pope's excellent **Pathogen** plugin to manage your Vim scripts.

### Pathogen Users
Clone the github repository into your **VIM/bundle** directory. Or else add it as a git submodule to the same place.

### Non-Pathogen Users
Copy **html_entities_helper.vim** into your **VIM/plugin** directory and restart.

Examples
--------
### &lt;leader&gt;He
Before: `© Copyright 2011 · All Rights Reserved.`

After: `&copy; Copyright 2011 &middot; All Rights Reserved.`

### &lt;leader&gt;Hn
Before: `&copy; Copyright 2011 &middot; All Rights Reserved.`

After: `&#169; Copyright 2011 &#183; All Rights Reserved.`

