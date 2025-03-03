
Action#nav_nfs_import
{
    text:"${import}"
    icon:"icons/16/import.svg"
}

Action#nav_nfs_export
{
    text:"${export}"
    icon:"icons/16/export.svg"
}
    
    
///------------
Action#act_nfs_host_add
{
    icon:"icons/24/add.svg"
    text:"${add_host}"
}

Action#act_nfs_host_add_group
{
    icon:"icons/24/add.svg"
    text:"${add_group}"
}

Action#act_nfs_host_edit
{
    icon:"icons/16/edit.svg"
    text:"${edit}"
}

Action#act_nfs_host_connect
{
    icon:"icons/16/connect.svg"
    text:"${connect}"
}

Action#act_nfs_host_remove
{
    icon:"icons/16/delete.svg"
    text:"${remove}"
}

Action#act_nfs_clear_cache
{
    icon:"icons/16/trash.svg"
    text:"${clear_cache}"
    enable:false
}

Action#act_nfs_super_cache
{
    icon:"icons/16/rocket.svg"
    text:"${super_cache}"
}

Action#act_nfs_clone
{
    icon:"icons/16/copy.svg"
    text:"${clone}"
}


///--------------------
#nfs_protocol_icons
{
    folder:"icons/mimetypes/24/folder.png"
    group:"icons/16/all.svg"
    http:"icons/24/http.svg"
    https:"icons/24/web.svg"
    webdav:"icons/24/cloud.svg"
    webdavs:"icons/24/clouds.svg"
    ftp:"icons/24/directory.svg"
    ftps:"icons/24/ftps.svg"
    ssh:"icons/24/ssh.svg"
}

InputDialog#nfs_edit_group
{
    mode:text
    width:400
    title:"${add} / ${edit}"
    label:"${group_name}:"
}


///--------------------
Menu#nfs_hosts_context_menu
{
    ${#act_nfs_host_add}
    ${#act_nfs_host_add_group}
    ${#act_nfs_host_edit}
    ---
    ${#act_nfs_host_connect}
    //${#act_nfs_super_cache}
    //${#act_nfs_clone}
    ---
    ${#act_nfs_host_remove}
    ${#act_nfs_clear_cache}
}

Widget#nav_nfs_hosts_panel
{
    layout:${.vboxlayout}
    HBoxLayout
    {
        Label{
            class:list_title
            text:"${host}"
        }
        ToolButton{
            action:${#act_nfs_host_add}
        }
    }
    LineEdit#nav_nfs_hosts_filter
    {
        placeholder:"${filter}"
    }
    CollapsibleList#nav_nfs_hosts
    {
        group-height:30
        group-icon-size:16
        item-height:32
        icon-size:24
        droppable:true
    }
    HBoxLayout
    {
        Label{
            class:list_title
            text:"${log}"
        }
    }
    StateButton#nav_nfs_tasks
    {
        icon:0
        icon-size:48
        icons:[
            "ui/css/images/tasks.png"
            "ui/css/images/tasks_loading.gif"
        ]
        ["${current}:",0]
        ["${total}:",0]
    }
    HBoxLayout
    {
        Label{
            class:list_title
            text:"${tools}"
        }
    }
    /*
    ToolBar
    {
        icon-size:16
        ${#nav_nfs_import}
        ${#nav_nfs_export}
    }
    */
}

VBoxLayout#nfs_layout
{
    margin:1
    spacing:0
    
    Tab#tabs
    {
        closable:true
        class:"frameless white"
        icon-size:24
        position:bottom
    }
    1
}
