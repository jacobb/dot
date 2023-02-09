
function! NextFileWee() abort
    let entry = expand('%:p')

    if empty(entry)
        let entry = getcwd() . '/'
    endif

    let dir_of_cur_entry = fnamemodify(entry, ':h')
    let entries          = globpath(dir_of_cur_entry, '*.md', 0, 1) 
    call reverse(entries)
    let idx = index(entries, entry)
    let prev_entry = entries[idx + 1]
    execute 'edit' prev_entry
    return prev_entry
endfu
