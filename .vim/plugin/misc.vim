
function! NextFileWee() abort
    let entry = expand('%:p')
    if !exists('s:entries')
        if empty(entry)
            let entry = getcwd() . '/'
        endif

        let dir_of_cur_entry = fnamemodify(entry, ':h')
        let s:entries          = globpath(dir_of_cur_entry, '*.md', 0, 1) 
        call reverse(s:entries)
    endif
    let s:idx = index(s:entries, entry)
    let prev_entry = s:entries[s:idx + 1]
    execute 'edit' prev_entry
    return prev_entry
endfu
