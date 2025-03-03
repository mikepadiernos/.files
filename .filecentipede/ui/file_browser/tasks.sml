Widget#empty
{
    layout:VBoxLayout
    column:1
    align:hcenter
    
    "${none}"
}

Tab#tab
{
    icon-size:24
    ${#tasks}
}
    
Dialog#main
{
    title:"${file_browser} - ${log}"
    width:760
    height:340
    layout:{
        type:VBoxLayout
        align:hcenter
        spacing:0
    }
    ${#empty}
    ${#tab}
} 
