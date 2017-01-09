" HTML Entities Helper
" Author: Chris Batchelor (github.com/firegoby), Nahuel Soldevilla (github.com/solde9)
" License: See UNLICENSE file or http://unlicense.org/
" Version: 1.1
" Last Updated: 29 September 2015
" Description: A few handy search and replace functions for quickly dealing
"              with HTML Entities and their unicode equivalents

if exists('g:loaded_html_entities_helper')
   finish
endif

let g:loaded_html_entities_helper = 1

"skip spaces
let g:html_entities_skip_spaces = 1

"keep &amp; first!
let g:html_entities_helper_array = [
    \ [ "&", "&amp;" , "&#38;" ],
    \ [ '"', "&quot;" , "&#34;" ],
    \ [ "'", "&apos;" , "&#39;" ],
    \ [ ">", "&gt;" , "&#62;" ],
    \ [ "<", "&lt;" , "&#63;" ],
    \ [ " ", "&nbsp;" , "&#160;" ],
    \ [ "¡", "&iexcl;" , "&#161;" ],
    \ [ "¢", "&cent;" , "&#162;" ],
    \ [ "£", "&pound;" , "&#163;" ],
    \ [ "¤", "&curren;" , "&#164;" ],
    \ [ "¥", "&yen;" , "&#165;" ],
    \ [ "¦", "&brvbar;" , "&#166;" ],
    \ [ "§", "&sect;" , "&#167;" ],
    \ [ "¨", "&uml;" , "&#168;" ],
    \ [ "©", "&copy;" , "&#169;" ],
    \ [ "ª", "&ordf;" , "&#170;" ],
    \ [ "«", "&laquo;" , "&#171;" ],
    \ [ "¬", "&not;" , "&#172;" ],
    \ [ "", "&shy;" , "&#173;" ],
    \ [ "®", "&reg;" , "&#174;" ],
    \ [ "¯", "&macr;" , "&#175;" ],
    \ [ "°", "&deg;" , "&#176;" ],
    \ [ "±", "&plusmn;" , "&#177;" ],
    \ [ "²", "&sup2;" , "&#178;" ],
    \ [ "³", "&sup3;" , "&#179;" ],
    \ [ "´", "&acute;" , "&#180;" ],
    \ [ "µ", "&micro;" , "&#181;" ],
    \ [ "¶", "&para;" , "&#182;" ],
    \ [ "·", "&middot;" , "&#183;" ],
    \ [ "¸", "&cedil;" , "&#184;" ],
    \ [ "¹", "&sup1;" , "&#185;" ],
    \ [ "º", "&ordm;" , "&#186;" ],
    \ [ "»", "&raquo;" , "&#187;" ],
    \ [ "¼", "&frac14;" , "&#188;" ],
    \ [ "½", "&frac12;" , "&#189;" ],
    \ [ "¾", "&frac34;" , "&#190;" ],
    \ [ "¿", "&iquest;" , "&#191;" ],
    \ [ "À", "&Agrave;" , "&#192;" ],
    \ [ "Á", "&Aacute;" , "&#193;" ],
    \ [ "Â", "&Acirc;" , "&#194;" ],
    \ [ "Ã", "&Atilde;" , "&#195;" ],
    \ [ "Ä", "&Auml;" , "&#196;" ],
    \ [ "Å", "&Aring;" , "&#197;" ],
    \ [ "Æ", "&AElig;" , "&#198;" ],
    \ [ "Ç", "&Ccedil;" , "&#199;" ],
    \ [ "È", "&Egrave;" , "&#200;" ],
    \ [ "É", "&Eacute;" , "&#201;" ],
    \ [ "Ê", "&Ecirc;" , "&#202;" ],
    \ [ "Ë", "&Euml;" , "&#203;" ],
    \ [ "Ì", "&Igrave;" , "&#204;" ],
    \ [ "Í", "&Iacute;" , "&#205;" ],
    \ [ "Î", "&Icirc;" , "&#206;" ],
    \ [ "Ï", "&Iuml;" , "&#207;" ],
    \ [ "Ð", "&ETH;" , "&#208;" ],
    \ [ "Ñ", "&Ntilde;" , "&#209;" ],
    \ [ "Ò", "&Ograve;" , "&#210;" ],
    \ [ "Ó", "&Oacute;" , "&#211;" ],
    \ [ "Ô", "&Ocirc;" , "&#212;" ],
    \ [ "Õ", "&Otilde;" , "&#213;" ],
    \ [ "Ö", "&Ouml;" , "&#214;" ],
    \ [ "×", "&times;" , "&#215;" ],
    \ [ "Ø", "&Oslash;" , "&#216;" ],
    \ [ "Ù", "&Ugrave;" , "&#217;" ],
    \ [ "Ú", "&Uacute;" , "&#218;" ],
    \ [ "Û", "&Ucirc;" , "&#219;" ],
    \ [ "Ü", "&Uuml;" , "&#220;" ],
    \ [ "Ý", "&Yacute;" , "&#221;" ],
    \ [ "Þ", "&THORN;" , "&#222;" ],
    \ [ "ß", "&szlig;" , "&#223;" ],
    \ [ "à", "&agrave;" , "&#224;" ],
    \ [ "á", "&aacute;" , "&#225;" ],
    \ [ "â", "&acirc;" , "&#226;" ],
    \ [ "ã", "&atilde;" , "&#227;" ],
    \ [ "ä", "&auml;" , "&#228;" ],
    \ [ "å", "&aring;" , "&#229;" ],
    \ [ "æ", "&aelig;" , "&#230;" ],
    \ [ "ç", "&ccedil;" , "&#231;" ],
    \ [ "è", "&egrave;" , "&#232;" ],
    \ [ "é", "&eacute;" , "&#233;" ],
    \ [ "ê", "&ecirc;" , "&#234;" ],
    \ [ "ë", "&euml;" , "&#235;" ],
    \ [ "ì", "&igrave;" , "&#236;" ],
    \ [ "í", "&iacute;" , "&#237;" ],
    \ [ "î", "&icirc;" , "&#238;" ],
    \ [ "ï", "&iuml;" , "&#239;" ],
    \ [ "ð", "&eth;" , "&#240;" ],
    \ [ "ñ", "&ntilde;" , "&#241;" ],
    \ [ "ò", "&ograve;" , "&#242;" ],
    \ [ "ó", "&oacute;" , "&#243;" ],
    \ [ "ô", "&ocirc;" , "&#244;" ],
    \ [ "õ", "&otilde;" , "&#245;" ],
    \ [ "ö", "&ouml;" , "&#246;" ],
    \ [ "÷", "&divide;" , "&#247;" ],
    \ [ "ø", "&oslash;" , "&#248;" ],
    \ [ "ù", "&ugrave;" , "&#249;" ],
    \ [ "ú", "&uacute;" , "&#250;" ],
    \ [ "û", "&ucirc;" , "&#251;" ],
    \ [ "ü", "&uuml;" , "&#252;" ],
    \ [ "ý", "&yacute;" , "&#253;" ],
    \ [ "þ", "&thorn;" , "&#254;" ],
    \ [ "ÿ", "&yuml;" , "&#255;" ],
    \ [ "Œ", "&OElig;" , "&#338;" ],
    \ [ "œ", "&oelig;" , "&#339;" ],
    \ [ "Š", "&Scaron;" , "&#352;" ],
    \ [ "š", "&scaron;" , "&#353;" ],
    \ [ "Ÿ", "&Yuml;" , "&#376;" ],
    \ [ "ƒ", "&fnof;" , "&#402;" ],
    \ [ "ˆ", "&circ;" , "&#710;" ],
    \ [ "˜", "&tilde;" , "&#732;" ],
    \ [ "Α", "&Alpha;" , "&#913;" ],
    \ [ "Β", "&Beta;" , "&#914;" ],
    \ [ "Γ", "&Gamma;" , "&#915;" ],
    \ [ "Δ", "&Delta;" , "&#916;" ],
    \ [ "Ε", "&Epsilon;" , "&#917;" ],
    \ [ "Ζ", "&Zeta;" , "&#918;" ],
    \ [ "Η", "&Eta;" , "&#919;" ],
    \ [ "Θ", "&Theta;" , "&#920;" ],
    \ [ "Ι", "&Iota;" , "&#921;" ],
    \ [ "Κ", "&Kappa;" , "&#922;" ],
    \ [ "Λ", "&Lambda;" , "&#923;" ],
    \ [ "Μ", "&Mu;" , "&#924;" ],
    \ [ "Ν", "&Nu;" , "&#925;" ],
    \ [ "Ξ", "&Xi;" , "&#926;" ],
    \ [ "Ο", "&Omicron;" , "&#927;" ],
    \ [ "Π", "&Pi;" , "&#928;" ],
    \ [ "Ρ", "&Rho;" , "&#929;" ],
    \ [ "Σ", "&Sigma;" , "&#931;" ],
    \ [ "Τ", "&Tau;" , "&#932;" ],
    \ [ "Υ", "&Upsilon;" , "&#933;" ],
    \ [ "Φ", "&Phi;" , "&#934;" ],
    \ [ "Χ", "&Chi;" , "&#935;" ],
    \ [ "Ψ", "&Psi;" , "&#936;" ],
    \ [ "Ω", "&Omega;" , "&#937;" ],
    \ [ "α", "&alpha;" , "&#945;" ],
    \ [ "β", "&beta;" , "&#946;" ],
    \ [ "γ", "&gamma;" , "&#947;" ],
    \ [ "δ", "&delta;" , "&#948;" ],
    \ [ "ε", "&epsilon;" , "&#949;" ],
    \ [ "ζ", "&zeta;" , "&#950;" ],
    \ [ "η", "&eta;" , "&#951;" ],
    \ [ "θ", "&theta;" , "&#952;" ],
    \ [ "ι", "&iota;" , "&#953;" ],
    \ [ "κ", "&kappa;" , "&#954;" ],
    \ [ "λ", "&lambda;" , "&#955;" ],
    \ [ "μ", "&mu;" , "&#956;" ],
    \ [ "ν", "&nu;" , "&#957;" ],
    \ [ "ξ", "&xi;" , "&#958;" ],
    \ [ "ο", "&omicron;" , "&#959;" ],
    \ [ "π", "&pi;" , "&#960;" ],
    \ [ "ρ", "&rho;" , "&#961;" ],
    \ [ "ς", "&sigmaf;" , "&#962;" ],
    \ [ "σ", "&sigma;" , "&#963;" ],
    \ [ "τ", "&tau;" , "&#964;" ],
    \ [ "υ", "&upsilon;" , "&#965;" ],
    \ [ "φ", "&phi;" , "&#966;" ],
    \ [ "χ", "&chi;" , "&#967;" ],
    \ [ "ψ", "&psi;" , "&#968;" ],
    \ [ "ω", "&omega;" , "&#969;" ],
    \ [ "ϑ", "&thetasym;" , "&#977;" ],
    \ [ "ϒ", "&upsih;" , "&#978;" ],
    \ [ "ϖ", "&piv;" , "&#982;" ],
    \ [ " ", "&ensp;" , "&#8194;" ],
    \ [ " ", "&emsp;" , "&#8195;" ],
    \ [ " ", "&thinsp;" , "&#8201;" ],
    \ [ "", "&zwnj;" , "&#8204;" ],
    \ [ "", "&zwj;" , "&#8205;" ],
    \ [ "‹", "&lsaquo;" , "&#8206;" ],
    \ [ "", "&rlm;" , "&#8207;" ],
    \ [ "–", "&ndash;" , "&#8211;" ],
    \ [ "—", "&mdash;" , "&#8212;" ],
    \ [ "‘", "&lsquo;" , "&#8216;" ],
    \ [ "’", "&rsquo;" , "&#8217;" ],
    \ [ "‚", "&sbquo;" , "&#8218;" ],
    \ [ "“", "&ldquo;" , "&#8220;" ],
    \ [ "”", "&rdquo;" , "&#8221;" ],
    \ [ "„", "&bdquo;" , "&#8222;" ],
    \ [ "†", "&dagger;" , "&#8224;" ],
    \ [ "‡", "&Dagger;" , "&#8225;" ],
    \ [ "•", "&bull;" , "&#8226;" ],
    \ [ "…", "&hellip;" , "&#8230;" ],
    \ [ "‰", "&permil;" , "&#8240;" ],
    \ [ "′", "&prime;" , "&#8242;" ],
    \ [ "″", "&Prime;" , "&#8243;" ],
    \ [ "‘", "&lsquo;" , "&#8249;" ],
    \ [ "›", "&rsaquo;" , "&#8250;" ],
    \ [ "‾", "&oline;" , "&#8254;" ],
    \ [ "⁄", "&frasl;" , "&#8260;" ],
    \ [ "€", "&euro;" , "&#8364;" ],
    \ [ "ℑ", "&image;" , "&#8465;" ],
    \ [ "℘", "&weierp;" , "&#8472;" ],
    \ [ "ℜ", "&real;" , "&#8476;" ],
    \ [ "™", "&trade;" , "&#8482;" ],
    \ [ "ℵ", "&alefsym;" , "&#8501;" ],
    \ [ "←", "&larr;" , "&#8592;" ],
    \ [ "↑", "&uarr;" , "&#8593;" ],
    \ [ "→", "&rarr;" , "&#8594;" ],
    \ [ "↓", "&darr;" , "&#8595;" ],
    \ [ "↔", "&harr;" , "&#8596;" ],
    \ [ "↵", "&crarr;" , "&#8629;" ],
    \ [ "⇐", "&lArr;" , "&#8656;" ],
    \ [ "⇑", "&uArr;" , "&#8657;" ],
    \ [ "⇒", "&rArr;" , "&#8658;" ],
    \ [ "⇓", "&dArr;" , "&#8659;" ],
    \ [ "⇔", "&hArr;" , "&#8660;" ],
    \ [ "∀", "&forall;" , "&#8704;" ],
    \ [ "∂", "&part;" , "&#8706;" ],
    \ [ "∃", "&exist;" , "&#8707;" ],
    \ [ "∅", "&empty;" , "&#8709;" ],
    \ [ "∇", "&nabla;" , "&#8711;" ],
    \ [ "∈", "&isin;" , "&#8712;" ],
    \ [ "∉", "&notin;" , "&#8713;" ],
    \ [ "∋", "&ni;" , "&#8715;" ],
    \ [ "∏", "&prod;" , "&#8719;" ],
    \ [ "∑", "&sum;" , "&#8721;" ],
    \ [ "−", "&minus;" , "&#8722;" ],
    \ [ "∗", "&lowast;" , "&#8727;" ],
    \ [ "√", "&radic;" , "&#8730;" ],
    \ [ "∝", "&prop;" , "&#8733;" ],
    \ [ "∞", "&infin;" , "&#8734;" ],
    \ [ "∠", "&ang;" , "&#8736;" ],
    \ [ "∧", "&and;" , "&#8743;" ],
    \ [ "∨", "&or;" , "&#8744;" ],
    \ [ "∩", "&cap;" , "&#8745;" ],
    \ [ "∪", "&cup;" , "&#8746;" ],
    \ [ "∫", "&int;" , "&#8747;" ],
    \ [ "∴", "&there4;" , "&#8756;" ],
    \ [ "∼", "&sim;" , "&#8764;" ],
    \ [ "≅", "&cong;" , "&#8773;" ],
    \ [ "≈", "&asymp;" , "&#8776;" ],
    \ [ "≠", "&ne;" , "&#8800;" ],
    \ [ "≡", "&equiv;" , "&#8801;" ],
    \ [ "≤", "&le;" , "&#8804;" ],
    \ [ "≥", "&ge;" , "&#8805;" ],
    \ [ "⊂", "&sub;" , "&#8834;" ],
    \ [ "⊃", "&sup;" , "&#8835;" ],
    \ [ "⊄", "&nsub;" , "&#8836;" ],
    \ [ "⊆", "&sube;" , "&#8838;" ],
    \ [ "⊇", "&supe;" , "&#8839;" ],
    \ [ "⊕", "&oplus;" , "&#8853;" ],
    \ [ "⊗", "&otimes;" , "&#8855;" ],
    \ [ "⊥", "&perp;" , "&#8869;" ],
    \ [ "⋅", "&sdot;" , "&#8901;" ],
    \ [ "⌈", "&lceil;" , "&#8968;" ],
    \ [ "⌉", "&rceil;" , "&#8969;" ],
    \ [ "⌊", "&lfloor;" , "&#8970;" ],
    \ [ "⌋", "&rfloor;" , "&#8971;" ],
    \ [ "◊", "&loz;" , "&#9674;" ],
    \ [ "♠", "&spades;" , "&#9824;" ],
    \ [ "♣", "&clubs;" , "&#9827;" ],
    \ [ "♥", "&hearts;" , "&#9829;" ],
    \ [ "♦", "&diams;" , "&#9830;" ],
    \ [ "⟨", "&lang;" , "&#10216;" ],
    \ [ "〉", "&rang;" , "&#10217;" ]
\]

" Convert 245 unicode characters to HTML entities (named)
" Characters NOT replaced: nbsp, emsp, ensp, shy, zwnj, zwj, lrm, rlm
" List from: -
" http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
function! s:encode_unicode() range
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  for i in g:html_entities_helper_array
      if i[0] == " " && g:html_entities_skip_spaces == 1
          continue
      endif
      execute a:firstline.",".a:lastline."s/".i[0]."/\\".i[1]."/egi"
  endfor
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Replaces all 253 named HTML entities with their repective unicode code point
" because XML doesn't have named entities other than amp, quot, apos, lt, gt
" List from: -
" http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
function! s:named_to_codepoint()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  for i in g:html_entities_helper_array
      execute a:firstline.",".a:lastline."s/".i[1]."/\\".i[2]."/egi"
  endfor
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Replaces all named HTML entities with their repective unicode characters
" List from: -
" http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
function! s:named_to_character() range
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  for i in g:html_entities_helper_array
      execute a:firstline.",".a:lastline."s/".i[2]."/\\".i[1]."/egi"
  endfor
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Encode unicode characters in current buffer to HTML Entities
noremap <silent> <leader>He :call s:encode_unicode()<CR>
" Convert all named HTML Entities in current buffer to numerical code point
noremap <silent> <leader>Hn :call s:named_to_codepoint()<CR>
" Replace all named HTML entities with their repective unicode characters
noremap <silent> <leader>Hd :call s:named_to_character()<CR>
