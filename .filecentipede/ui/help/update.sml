#page_update
{
    text:"${update}"
    layout:VBoxLayout
    GroupBox#info
    {
        title:"${info}"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${current_version}: " LineView{value:"${__version__}"}
        "${latest_version}: " LineView{name:latest_version,value:"${unknown}"}
        
        "${last_checked_time}: " LineView{
            name:last_check_time
            format:datetime
            value:"${unknown}"
        }
        "${uptime}: " LineView{
            name:uptime
            format:datetime
            value:"${unknown}"
        }
    }
    GroupBox#settings
    {
        title:"${settings}"
        layout:VBoxLayout
        
        HBoxLayout
        {
            CheckBox{
                name:auto_update_major
                text:"${auto_update_major}"
            }
            CheckBox{
                name:auto_update_minor
                text:"${auto_update_minor}"
            }
            CheckBox{
                name:auto_check_update
                text:"${auto_check_update}"
                value:true
            }
            SpinBox{
                name:check_interval
                min:2
                value:24
                suffix:"${hours}"
            }
        }
    }
    TextEdit#detail{
        name:details
        readonly:true
        placeholder:"${detail}"
    }
    HBoxLayout
    {
        "${state}: " Label{name:state}
        
        <==>
        "${progress}: " Progress{
            name:progress
            value:0
        }
    }
}

#page_source
{
    text:"${source}"
    layout:VBoxLayout
    
    TextEdit
    {
        name:url
        placeholder:"${update_url_placeholder_}"
    }
}
        
        
Dialog#main
{
    title:"${update}"
    icon:"icons/16/update.svg" 
    layout:VBoxLayout
    
    Tab
    {
        ${#page_update}
        ${#page_source}
    }
    HBoxLayout
    {
        Widget#status
        {
            visible:false
            layout:HBoxLayout
            Img{src:"ui/css/images/loading.gif"}
            "${checking}..."
        }
    
        <==>
        Button#check_update{
            text:"${check_update}"
            icon:"icons/16/refresh.svg"
            click:$filec-send("update_check")
        }
        Button#upgrade{
            text:"${upgrade}"
            enable:false
            icon:"icons/16/upgrade.svg"
            click:$filec-send("update_upgrade")
        }
        Button#close{
            text:"${close}"
            icon:"icons/16/close.svg"
            click:$close{#main}()
        }
    }
}

