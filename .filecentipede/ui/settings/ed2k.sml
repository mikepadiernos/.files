
#page_ed2k_task
{
    text:"${task}"
    layout:VBoxLayout
    GroupBox
    {
        layout:VBoxLayout
        "${ed2k_not_support}"
        "${version} >= 3.0"
        <==>
    }
}  


Tab#ed2k
{
    visible:false
    ${#page_ed2k_task}
}

