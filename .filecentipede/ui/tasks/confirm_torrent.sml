
Action#act_check_on
{
	text:"${checkbox_on}"
    icon:"icons/16/none.svg"
}

Action#act_uncheck_off
{
	text:"${checkbox_off}"
    icon:"icons/16/none.svg"
}

Action#act_check_all
{
	text:"${checkbox_on_all}"
    icon:"icons/16/none.svg"
}

Action#act_uncheck_all
{
	text:"${checkbox_off_all}"
    icon:"icons/16/none.svg"
}

Menu#context_menu
{
    ${#act_check_on}
    ${#act_uncheck_off}
    ${#act_check_all}
    ${#act_uncheck_all}
}

#attrbutes
{
    text: "${attributes}"
    layout: VBoxLayout
    
    FileSystem#files
    {
        sortable:true
        stripe:true
        editable:false
        checkable:true
        selection:rows
        icon-size:24
        context-menu:${#context_menu}
        columns-height:26
        columns:{
            {name:file_name,text:"${name}",width:500}
            {name:file_size,text:"${size}",width:80,format:bytes}
        }
        layout:{
            type:VBoxLayout
            align:center
            
            Widget#loading
            {
                css:"background:transparent"
                layout:{
                    type:VBoxLayout
                    column:1
                    align:hcenter
                }
                Img{src:"ui/css/images/loading_clock.gif"}
                "${downloading_metadata}"
            }
        }
    }
    HBoxLayout
    {
        "${filter}:" ComboBox#filter
        {
            min-width:80
            vtype:data
            editable:false
            
            "${none}"
        }
        ComboBox#filter_size_type
        {
            min-width:80
            vtype:index
            editable:false
            enable:false
            
            "${none}"
            "${largest_file}"
            "${smallest_file}"
            "${greater_than}"
            "${less_than}"
        }
        SpinBox#filter_size{
            min:0
            max:99999
            value:1
            enable:false
        }
        ComboBox#filter_size_unit{
            vtype:index
            editable:false
            value:2
            "B","KB","MB","GB","TB"
        }
        <==>
        CheckBox{
            name:auto_rename_file
            text:"${auto_rename_file}"
        }
        CheckBox{
            name:sequential
            text:"${sequential_download}"
        }
    }
    
    GroupBox
    {
        title:"${options}"
        layout:{
            type:GridLayout
            column:6
        }
        "${max_connections}:" ComboBox{
            name:max_connections
            vtype:number
            editable:true
            1 2 4 8 16 32 64 128 256 512 1024 2048 4096
        }
        
        "${speed_limit_upload}:" SpinBox{
            name:speed_limit_upload
            max:999999999
            suffix:KB
            step:100
            special-text:"${unlimited}"
        }
        
        "${speed_limit_download}:" SpinBox{
            name:speed_limit_download
            max:999999999
            suffix:KB
            step:100
            special-text:"${unlimited}"
        }
    }
        
    GroupBox
    {
        title:"${save}"
        layout:{
            type:GridLayout
            column:2
        }
        "${file_name}:" HBoxLayout
        {
            LineEdit{
                name:file_name
            }
            "${catalog}:" ComboBox#catalog{
                name:catalog
                vtype:data
                editable:false
                
                "  ---  "
            }
        }
            
        "${save_path}:" HBoxLayout
        {
            ComboBox#save_path
            {
                name:save_path
                vtype:text
                editable:true
                stretch:"expand"
                placeholder:"${save_path_placeholder}"
                items:$filec-paths()
            }
            Button{
                text:"..."
                click:$select-dir("${save_path}",${#save_path})
            }
        }
    }

}


#information
{
    text: "${info}"
    layout: VBoxLayout
    
    GroupBox
    {
        title:"${info}"
        layout:VBoxLayout
        Edit{
            name:torrent_comment
            viewonly:true
        }
        GridLayout
        {
            column:4
            margin:4
            
            "${creator}:" LineView{name:torrent_creator}
            "${creation_date}" LineView{name:torrent_creation_date,format:datetime}
            
            "${name}:" LineView{name:torrent_name}
            "HASH:" LineView{name:hash}
        }
       
    }
 
}


Dialog#main
{
    title:"${add_task}"
    layout:VBoxLayout
    w:700
    h:550
    
    Tab#tab
    {
        ${#attrbutes}
        ${#information}
    }
   
 
    HBoxLayout
    {
        CheckBox#without_confirm{
            text:"${dont_show_this_again}"
        }
        <==>
        Button{
            text:"${cancel}"
            click:$close{#main}()
        }
        Button#ok{
            text:"${OK}"
        }
    }
}
