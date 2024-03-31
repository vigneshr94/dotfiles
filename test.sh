
find_and_edit_with_editor_of_choice ()
{
    local file
    local editor=$1
    file=$(find * -type f | fzf --border --reverse --preview="bat --number --color=always {}")
    if [ "$file" != "" ] && [ "$editor" != "" ]; then
        $editor $file
    fi
}

find_and_edit_with_editor_of_choice $1
