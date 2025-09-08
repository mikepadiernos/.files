Alert#force_restart
{
    icon:warning
    title:"${force_restart}"
    text:"${force_restart_alert_}"
    
    {
        value:1
        text:"${OK}"
    }
    {
        value:0
        text:"${cancel}"
    }
}

Alert#fully_shutdown
{
    icon:warning
    title:"${fully_shutdown}"
    text:"${fully_shutdown_alert_}"

    {
        value:1
        text:"${OK}"
    }
    {
        value:0
        text:"${cancel}"
    }
}


Alert#open_file_nexists
{
    icon:error
    title:"${error}"
    text:"${open_file_error}: ${file_nexists_alert_}"
    
    {
        value:1
        icon:"icons/16/delete.svg"
        text:"${delete_task}"
    }
    {
        value:0
        text:"${cancel}"
    }
}


Alert#delete_task
{
    icon:question
    title:"${delete_task}"
    text:"${delete_task_alert}"
    
    {
        value:1
        text:"${delete_task}"
    }
    {
        value:2
        text:"${delete_task_and_file}"
    }
    {
        value:0
        text:"${cancel}"
    }
}

Alert#delete_all_tasks
{
    icon:warning
    title:"${delete_all_tasks}"
    text:"${delete_all_tasks_alert}"
    
    {
        value:1
        text:"${delete_task}"
    }
    {
        value:2
        text:"${delete_task_and_file}"
    }
    {
        value:0
        text:"${cancel}"
    }
}

Alert#delete_catalog
{
    icon:warning
    title:"${delete_catalog}"
    text:"${delete_catalog_alert}"
    
    {
        value:1
        text:"${delete_catalog_only}"
    }
    {
        value:2
        text:"${also_delete_tasks}"
    }
    {
        value:3
        text:"${also_tasks_and_files}"
    }
    {
        value:0
        text:"${cancel}"
    }
}


InputDialog#delete_all_tasks_confirm
{
    mode:text
    title:"${delete_all_tasks}"
    label:"${operation_confirm_input_}"
}

InputDialog#rename_task
{
    mode:text
    width:400
    title:"${rename}"
    label:"${file_name}:"
    
}

Widget#backend_loading
{
    layout:{
        type:VBoxLayout
        column:1
        align:hcenter
        spacing:30
    }
    Widget
    {
        class:backend_loading
        layout:{
            type:VBoxLayout
            margin:50
            spacing:20
        }
        HBoxLayout
        {
            spacing:10
            Img{src:"ui/css/images/loading_backend.gif"}
            VBoxLayout
            {
                spacing:4
                Label#backend_loading_title{
                    css:"font-weight:bold;font-size: 16px"
                    "${waiting}"
                }
                Label#backend_loading_text{
                    "${waiting_for_filec_running}."
                }
            }
            <==>
        }
        HBoxLayout
        {
            spacing:20
            
            <==>
            ToolButton#backend_loading_launch{
                text:"${launch}"
                click:$filec-launch()
            }
            ToolButton#backend_force_restart{
                visible:false
                text:"${force_restart}"
                click:$filec-force-restart()
            }
            ToolButton{
                text:"${exit}"
                click:$exit()
            }
            <==>
        }
    }
    
}
            
