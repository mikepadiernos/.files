Action#act_upload
{
    text:"${files}"
    icon:"icons/24/upload.svg"
    enable:false
}

Action#act_upload_directory
{
    text:"${directory}"
    icon:"icons/24/upload.svg"
    enable:false
}

Action#act_download
{
    text:"${download}"
    icon:"icons/24/download.svg"
    enable:false
}

Action#act_delete
{
    text:"${delete}"
    icon:"icons/16/delete.svg"
    shortcut:"Delete"
    enable:false
}

Action#act_create_directory
{
    text:"${create_directory}"
    icon:"icons/16/directory.svg"
    enable:false
}

Action#act_open
{
    text:"${open}"
    icon:"icons/16/run.svg"
    shortcut:"Return"
    enable:false
}

Action#act_edit
{
    text:"${edit}"
    icon:"icons/16/edit.svg"
    shortcut:"Ctrl+E"
    enable:false
}

Action#act_open_new_tab
{
    text:"${open_with_new_tab}"
    icon:"icons/16/directory.svg"
    enable:false
}

Action#act_create_file
{
    text:"${create_file}"
    icon:"icons/16/add_file.svg"
    enable:false
}

Action#act_rename
{
    text:"${rename}"
    icon:"icons/16/rename.svg"
    enable:false
    shortcut:"F2"
}

Action#act_move
{
    icon:"icons/16/move.svg"
    text:"${move_to}..."
    enable:false
}

Action#act_copy
{
    text:"${copy}"
    icon:"icons/16/copy.svg"
    enable:false
    shortcut:"Ctrl+C"
}

Action#act_cut
{
    text:"${cut}"
    icon:"icons/16/cut.svg"
    enable:false
    shortcut:"Ctrl+X"
}

Action#act_paste
{
    text:"${paste}"
    icon:"icons/16/paste.svg"
    enable:false
    shortcut:"Ctrl+V"
}

Action#act_attribute
{
    text:"${attributes}"
    icon:"icons/16/setting.svg"
    enable:false
    shortcut:"Alt+Return"
}

Action#act_search
{
    text:"${search}"
    icon:"icons/16/search.svg"
    enable:false
    shortcut:"Ctrl+F"
}

Action#act_filter
{
    text:"${filter}"
    icon:"icons/16/filter.svg"
    checkable:true
}

Action#act_super_cache
{
    text:"${super_cache}"
    enable:false
    icon:"icons/16/rocket.svg"
}

Action#act_clone
{
    text:"${clone}"
    enable:false
    icon:"icons/16/copy.svg"
}

Action#act_copy_url
{
    text:"${copy} -> URL"
    enable:false
    icon:"icons/16/copy.svg"
}

Action#act_copy_path
{
    text:"${copy} -> ${path}"
    enable:false
    icon:"icons/16/copy.svg"
}


//------------------
Action#act_view_icon
{
    text:"${icons}"
    icon:"icons/16/icons.svg"
    checkable:true
}

Action#act_view_tree
{
    text:"${grid}"
    icon:"icons/16/tree.svg"
    checkable:true
}


//------------------
Action#act_go_previous
{
    icon:"icons/24/go-previous.svg"
    text:"${go_previous}"
    enable:false
    shortcut:"backspace"
}

Action#act_go_next
{
    icon:"icons/24/go-next.svg"
    text:"${go_next}"
    enable:false
}

Action#act_go_up
{
    icon:"icons/24/go-up.svg"
    text:"${go_up}"
    enable:false
}

Action#act_refresh
{
    text:"${refresh}"
    icon:"icons/24/refresh.svg"
    enable:false
    shortcut:"F5"
}


//------------------
#act_create
{
    button-style:TextBesideIcon
    text:"${create}"
    icon:"icons/24/add_file.svg"
    action:${#act_create_directory}
    
    ${#act_create_directory}
    ${#act_create_file}
}


//------------------
Menu#files_context_menu
{
    ${#act_open}
    ${#act_edit}
    ${#act_open_new_tab}
    ---
    ${#act_create}
    ${#act_rename}
    ${#act_move}
    ${#act_copy}
    ${#act_cut}
    ${#act_paste}
    ${#act_delete}
    
    ---
    ${#act_refresh}
    {
        text:"${upload}"
        icon:"icons/24/upload.svg"
        action:${#act_upload}
    
        ${#act_upload}
        ${#act_upload_directory}
    }
    ${#act_download}
   
    ---
    {
        text:"${more}..."
        icon:"icons/16/all.svg"
        
        ${#act_copy_url}
        ${#act_copy_path}
        ${#act_search}
        ${#act_clone}
        //${#act_super_cache}
    }

    
}


HBoxLayout#toolbar
{
    ToolBar
    {
        icon-size:24
    
        ${#act_go_previous}
        ${#act_go_next}
        ${#act_go_up}
        ---
        ${#act_refresh}
        ---
    }
    ToolBar
    {
        icon-size:24
        button-style:TextBesideIcon

        ${#act_create}
        ${#act_delete}
        
        ---
        {
            button-style:TextBesideIcon
            text:"${upload}"
            icon:"icons/24/upload.svg"
            action:${#act_upload}
        
            ${#act_upload}
            ${#act_upload_directory}
        }
        ${#act_download}
        
        ---
        {
            popup-mode:instant
            button-style:TextBesideIcon
            icon:"icons/24/all.svg"
    
            ${#act_open}
            ${#act_edit}
            ${#act_rename}
            ${#act_move}
            ${#act_copy}
            ${#act_cut}
            ${#act_paste}
            ${#act_search}
            //${#act_super_cache}
            ${#act_clone}
        }
    }
    <==>
    ToolBar
    {
        icon-size:24
        button-style:Icon
        ${#act_filter}
    }
    
}

HBoxLayout#location_layout
{
    margin:1
    spacing:2
    ComboBox#protocols
    {
        vtype:data
        size-adjust:content
        /*
        {
            text:"HTTP"
            icon:"icons/16/http.svg"
            data:"http"
        }
        {
            text:"HTTPS"
            icon:"icons/16/web.svg"
            data:"https"
        }
        */
        {
            text:"WebDAV"
            icon:"icons/16/cloud.svg"
            data:"webdav"
        }
        {
            text:"WebDAVS"
            icon:"icons/16/clouds.svg"
            data:"webdavs"
        }
        {
            text:"FTP"
            icon:"icons/16/directory.svg"
            data:"ftp"
        }
        {
            text:"FTPS"
            icon:"icons/16/ftps.svg"
            data:"ftps"
        }
        {
            text:"SSH"
            icon:"icons/16/ssh.svg"
            data:"ssh"
        }
    }
    AddressBar#addresses
    {
        size-adjust:content
        stretch:expand
        editable:true
        icon:"icons/16/directory.svg"
        placeholder:"${address}"
    }
    /*
    ToolButton#favorites
    {
        button-style:Icon
        popup-mode:instant
        icon:"icons/16/favorites.svg"
        text:"${favorites}"
    }
    */
    ToolButton
    {
        visible:false
        button-style:TextBesideIcon
        popup-mode:instant
        icon:"icons/16/view.svg"
        text:"${view}"

        ${#act_view_icon}
        ${#act_view_tree}
    }
}
    
Widget#filter
{
    visible:false
    layout:{
        type:HBoxLayout
        margin:1
        spacing:2
    }
    
    ComboBox#filter_types
    {
        vtype:index
        size-adjust:content
        {
            text:"${name}"
            icon:"icons/16/filter.svg"
        }
        {
            text:"${file}"
            icon:"icons/16/filter.svg"
        }
        {
            text:"${directory}"
            icon:"icons/16/filter.svg"
        }
    }
    ComboBox#filter_rules
    {
        min-width:80
        vtype:data
        editable:false
        
        "${none}"
    }
    LineEdit#filter_text
    {
        size-adjust:content
        stretch:expand
        editable:true
        placeholder:"${keyword}"
    }
}

FileSystem#grid
{
    sortable:true
    stripe:true
    editable:false
    wordwrap:false
    droppable:true
    draggable:false
    checkable:child
    selection:rows
    icon-size:24
    columns-height:26
    columns:{
        {name:name,text:"${name}",width:320,sort:asc}
        {name:type,text:"${type}",width:100}
        {name:size,text:"${size}",width:80,align:right,format:bytes}
        {name:mtime,text:"${last_modified}",width:160,align:left,format:datetime}
        {name:attr,text:"${attributes}"}
        {name:path,text:"${path}",visible:false}
    }
    context-menu:${#files_context_menu}
    layout:{
        type:VBoxLayout
        align:center
        
        Widget#loading
        {
            visible:false
            css:"background:transparent"
            layout:{
                type:VBoxLayout
                column:1
                align:hcenter
            }
            Img#loading_img{src:"ui/css/images/loading_clock.gif"}
        }
    }
}

List#icons
{
    visible:false
    view-mode:icon
    resize-mode:adjust
    word-wrap:true
    selection:cells
    spacing:10
    icon-size:48
}

Widget#filesystem
{
    droppable:true
    layout:{
        type:VBoxLayout
        margin:0
        spacing:0
    }

    ${#toolbar}
    ${#location_layout}
    ${#filter}
    2
    ${#grid}
    ${#icons}
}
