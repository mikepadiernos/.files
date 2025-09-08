Action#act_add_subscribe{
    text:"${add}"
    icon:"icons/24/add.svg"
    trigger:$add{#dialog_subscribe}()
}
Action#act_edit_subscribe{
    text:"${edit}"
    icon:"icons/16/edit.svg"
}
Action#act_remove_subscribe{
    text:"${delete}"
    icon:"icons/16/delete.svg"
    trigger:$filec-send("subscribe_remove",{
        type:1,
        id:$current-row-data{#subscribes}()
    })
}
Action#act_update_trackers{
    text:"${update_subscribe}"
    icon:"icons/16/update.svg"
}
            

EditDialog#dialog_subscribe
{
    layout:VBoxLayout
    width:400
    height:200
    title-add:"${add}"
    title-edit:"${edit}"
    form:${#dialog_subscribe}
    buttons:default
    TextEdit{
        name:url
        placeholder:"${add_subscribe_placeholder_}"
    }
}

#tab_trackers
{
    text:"${list}"
    layout:VBoxLayout

    "${downloaded_from_subscribed_url}" TextEdit#trackers_list{
        readonly:true
    }
}


#tab_subscribe
{
    text:"${subscribe}"
    layout:VBoxLayout
    ToolBar
    {
        icon-size:16
        button-style:TextBesideIcon
    
        ${#act_add_subscribe}
        ${#act_edit_subscribe}
        ${#act_remove_subscribe}
        ${#act_update_trackers}
    }
    Table#subscribes
    {
        sortable:true
        stripe:true
        editable:false
        wordwrap:false
        stretch-last-section:false
        selection:rows
        columns-height:26
        columns:{
            {name:url,text:"URL",width:360}
            {name:uptime,text:"${uptime}",width:130,format:datetime}
            {name:time_add,text:"${time_add}",width:130,format:datetime}
        }
        double-click:$trigger{#act_edit_subscribe}()
        context-menu:
        {
            ${#act_add_subscribe}
            ${#act_edit_subscribe}
            ${#act_remove_subscribe}
            ${#act_update_trackers}

        }
    }
}

#tab_settings
{
    text:"${settings}"
    layout:VBoxLayout
    GroupBox
    {
        title:"${update}"
        layout:HBoxLayout
        CheckBox{
            name:auto_update_subscribe
            text:"${auto_update_subscribe}"
        }
        CheckBox{
            name:use_proxy_update
            text:"${use_proxy_update}"
        }
        <==>
        "${auto_update_interval}:" SpinBox{
            name:auto_update_interval
            min:1
            suffix:"${hours}"
        }
    }
    GroupBox
    {
        title:"${auto_add_trackers_to_new_task}"
        layout:VBoxLayout

        TextEdit{
            name:new_task_trackers
        }
        
        HBoxLayout
        {
            HBoxLayout
            {
                CheckBox
                {
                    text:"${including}: ${downloaded_from_subscribed_url}"
                    name:import_subscribed
                }
                SpinBox{
                    special-text:"${all}"
                    name:import_subscribed_num
                    min:0
                    max:999
                    value:20
                }
                <==>
            }
           
        }
    }
    HBoxLayout
    {
        <==>
    
        Button#save{
            text:"${save}"
            icon:"icons/16/save.svg"
        }
        Button{
            text:"${cancel}"
            icon:"icons/16/cancel.svg"
            click:$close{#main}()
        }
    }
}


Dialog#main
{
    title:"${tracker}"
    width:700
    height:450
    layout:VBoxLayout

    Tab#tabs
    {
        ${#tab_trackers}
        ${#tab_subscribe}
        ${#tab_settings}
    }
} 
