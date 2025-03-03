Action#act_add
{
    text:"${add}"
    icon:"icons/24/add.svg"
    trigger:$open-window("ui/remote/edit_host.sml","#main")
}

Action#act_remove
{
    text:"${delete}"
    icon:"icons/16/delete.svg"
    enable:false
}

Action#act_connect
{
    text:"${connect}"
    icon:"icons/16/connect.svg"
    enable:false
}

Action#act_desktop_shortcuts
{
    text:"${desktop_shortcuts}"
    icon:"icons/16/none.svg"
    enable:false
}

Dialog#main
{
    w:600
    h:400
    title:"${manage_hosts}"
    layout:VBoxLayout
    
    ToolBar{
        icon-size:16
        button-style:TextBesideIcon
        
        ${#act_add}
        ${#act_remove}
        ${#act_connect}
        
        ---
        ${#act_desktop_shortcuts}
    }
    Table#hosts{
        sortable:true
        wordwrap:false
        stretch-last-section:true
        editable:false
        selection:rows
        columns-height:26
        columns:{
            {name:name,text:"${name}",width:120}
            {name:host,text:"${host}",width:180}
            {name:port,text:"${port}",width:90}
        }
        double-click:$trigger{#act_edit}()
        context-menu:
        {
            ${#act_add}
            ${#act_remove}
            ${#act_connect}
            ---
            
            ${#act_desktop_shortcuts}

        }
    }
}
