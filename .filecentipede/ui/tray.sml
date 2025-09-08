Tray#tray
{
    icon:"icons/icon.png"
    tooltip:"${software_name_}"
    context-menu:{
        Action{
            text:"${show} / ${hide}"
            trigger:$visible{#main}("!")
        }
        ---
        ${#act_open}
        ${#act_task_add}
        ${#act_task_add_directory}
        ${#act_task_add_stream}
        //${#act_task_upload}
        ---
        ${#act_task_start_all}
        ${#act_task_stop_all}
        
        ---
        ${#act_settings}
        
        ---
        ${#act_force_restart}
        ${#act_fully_shutdown}

        ---
        ${#act_exit}
    }
    trigger:{
        $visible{#main}("!",true)
    }
}
