Action#act_proxy_add
{
    text:"${add}"
    icon:"icons/24/add.svg"
}

Action#act_proxy_edit
{
    text:"${edit}"
    icon:"icons/16/edit.svg"
}

Action#act_proxy_remove
{
    text:"${remove}"
    icon:"icons/16/delete.svg"
}

Action#act_proxy_import
{
    text:"${import}"
    icon:"icons/16/import.svg"
    enable:false
}

Action#act_proxy_export
{
    text:"${export}"
    icon:"icons/16/export.svg"
    enable:false
}

Action#act_proxy_test
{
    text:"${test}"
    icon:"icons/16/ok.svg"
}

EditDialog#dialog_edit
{
    title-add:"${add}"
    title-edit:"${edit}"
    form:${#dialog_edit}
    layout:VBoxLayout
    buttons:default
    GridLayout
    {
        column:2
        "${name}:" LineEdit{
            name:name
        }
        "${type}:" ComboBox{
            name:type
            vtype:text
            current:0
            
            socket5
            HTTP
        }
        
        "${host}:" LineEdit{
            name:host
            value:"127.0.0.1"
        }
        "${port}:" SpinBox{
            name:port
            min:1
            max:65535
            1080
        }
        
        "${user}:" LineEdit{
            name:user
        }
        "${password}:" LineEdit{
            name:pass
            type:password
        }
    }
}

#proxies_list
{
    text:"${proxies}"
    layout:{
        type:VBoxLayout
        spacing:0
        margin:2
    }
    ToolBar
    {
        icon-size:18
        button-style:TextBesideIcon
        
        ${#act_proxy_add}
        ${#act_proxy_edit}
        ${#act_proxy_remove}
        ---
        /*
        ${#act_proxy_import}
        ${#act_proxy_export}
        ---
        */
        ${#act_proxy_test}
        
    }
    Table#proxies
    {
        sortable:true
        editable:false
        stripe:true
        stretch:expand
        stretch-last-section:true
        selection:rows
        columns-height:26
        columns:{
            {name:name,text:"${name}",width:100}
            {name:type,text:"${type}",width:80}
            {name:host,text:"${host}",width:120}
            {name:port,text:"${port}",width:60}
            {name:user,text:"${user}"}
            {name:pass,text:"${password}"}
            {name:state,text:""}
        }
        double-click:$trigger{#act_proxy_edit}()
        context-menu:{
            ${#act_proxy_add}
            ${#act_proxy_edit}
            ${#act_proxy_remove}
            ---
            ${#act_proxy_import}
            ${#act_proxy_export}
        }
    }
}

#proxies_subscribe
{
    text:"${subscribe}"
    layout:VBoxLayout
    
    "TODO:"
    <==>
}

#proxies_spider
{
    text:"${spider}"
    layout:VBoxLayout
    
    "TODO:"
    <==>
}

Dialog#main
{
    title:"${proxies}"
    layout:VBoxLayout
    width:720
    height:450
    Tab{
        ${#proxies_list}
        ${#proxies_subscribe}
        ${#proxies_spider}
    }
    
   
}  
