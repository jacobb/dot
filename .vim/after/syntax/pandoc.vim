syn match pandocAtxHeader1 /\(\%^\|<.\+>.*\n\|^\s*\n\)\@<=#\{1}.*\n/ contains=pandocEmphasis,pandocStrong,pandocNoFormatted,pandocLaTeXInlineMath,pandocEscapedDollar,@Spell,pandocAmpersandEscape,pandocReferenceLabel,pandocReferenceURL display
syn match pandocAtxHeader2 /\(\%^\|<.\+>.*\n\|^\s*\n\)\@<=#\{2}.*\n/ contains=pandocEmphasis,pandocStrong,pandocNoFormatted,pandocLaTeXInlineMath,pandocEscapedDollar,@Spell,pandocAmpersandEscape,pandocReferenceLabel,pandocReferenceURL display
syn match pandocAtxHeader3 /\(\%^\|<.\+>.*\n\|^\s*\n\)\@<=#\{3}.*\n/ contains=pandocEmphasis,pandocStrong,pandocNoFormatted,pandocLaTeXInlineMath,pandocEscapedDollar,@Spell,pandocAmpersandEscape,pandocReferenceLabel,pandocReferenceURL display
syn match pandocAtxHeader4 /\(\%^\|<.\+>.*\n\|^\s*\n\)\@<=#\{4,6}.*\n/ contains=pandocEmphasis,pandocStrong,pandocNoFormatted,pandocLaTeXInlineMath,pandocEscapedDollar,@Spell,pandocAmpersandEscape,pandocReferenceLabel,pandocReferenceURL display


syn match pandocAtxHeaderMark /\(^#\{1,6}\|\\\@<!#\+\(\s*.*$\)\@=\)/ contained containedin=pandocAtxHeader1,pandocAtxHeader2,pandocAtxHeader3,pandocAtxHeader4
syn match pandocSetexHeader /^.\+\n[=]\+$/ contains=pandocEmphasis,pandocStrong,pandocNoFormatted,pandocLaTeXInlineMath,pandocEscapedDollar,@Spell,pandocAmpersandEscape
syn match pandocSetexHeader /^.\+\n[-]\+$/ contains=pandocEmphasis,pandocStrong,pandocNoFormatted,pandocLaTeXInlineMath,pandocEscapedDollar,@Spell,pandocAmpersandEscape
syn match pandocHeaderAttr /{.*}/ contained containedin=pandocAtxHeader1,pandocAtxHeader2,pandocAtxHeader3,pandocAtxHeader4,pandocSetexHeader

hi link pandocAtxHeader1 GruvboxOrangeBold
hi link pandocAtxHeader2 GruvboxPurpleBold
hi link pandocAtxHeader3 GruvboxBlueBold
hi link pandocAtxHeader4 GruvboxRedBold
