InputDialog#merge_dialog
{
    type:ComboBox
    title:"${merge_catalog}"
    label:"${merge_to}:"
}

///----------------------
Action#act_add
{
    text:"${add}"
    icon:"icons/24/add.svg"
}

Action#act_edit
{
    text:"${edit}"
    icon:"icons/16/edit.svg"
}

Action#act_delete
{
    text:"${delete}"
    icon:"icons/16/delete.svg"
}

Action#act_merge
{
    text:"${merge}"
    icon:"icons/16/file.svg"
}


///----------------------
Menu#context_menu
{
    ${#act_add}
    ${#act_rename}
    ${#act_edit}
    ${#act_delete}
    ---
    ${#act_merge}
}
