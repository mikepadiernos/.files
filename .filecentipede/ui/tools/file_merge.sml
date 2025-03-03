Action#act_normal_add
{
    text:"${add}"
    icon:"icons/16/add_file.svg"
}

Action#act_normal_remove
{
    text:"${remove}"
    icon:"icons/16/delete.svg"
}

Action#act_normal_clear
{
    text:"${clear}"
    icon:"icons/16/delete_all.svg"
}

Action#act_normal_merge
{
    text:"${merge}"
    icon:"icons/16/save_as.svg"
    enable:false
}


#normal_merge
{
    text:"${normal_merge}"
    layout:VBoxLayout
    ToolBar
    {
        icon-size:16
        button-style:TextBesideIcon
        
        ${#act_normal_add}
        ${#act_normal_remove}
        ${#act_normal_clear}
        ---
        ${#act_normal_merge}
    }
    Table#normal_files
    {
        name:files
        sortable:false
        stripe:true
        editable:false
        wordwrap:false
        selection:rows
        numbers:true
        stretch-last-section:true
        columns-height:26
        columns:{
            {name:size,text:"${size}",width:120}
            {name:path,text:"${path}"}
        }
        context-menu:{
            ${#act_normal_add}
            ${#act_normal_remove}
            ${#act_normal_clear}
            ---
            ${#act_normal_merge}
        }
    }
    
}

#video_audio_merge
{
    text:"${video}+${audio} ${merge}"
    layout:VBoxLayout
    
    GridLayout
    {
        column:2
        "FFmpeg ${path}:" PathEdit{
            name:ffmpeg_path
        }
        "${video}:" PathEdit{
            name:video_path
        }
        "${audio}:" PathEdit{
            name:audio_path
        }
    }
    <==>
    HBoxLayout{
        "FFmpeg ${download}:" A{"https://ffmpeg.org/download.html"} <==>
    }
    
    HBoxLayout
    {
        <==>
        Button#btn_video_audio_merge{
            text:"${merge}"
        }
    }
}

Dialog#main
{
    title:"${file_merge}"
    layout:VBoxLayout
    droppable:true
    w:600
    h:400

    Tab#tab{
        ${#normal_merge}
        ${#video_audio_merge}
    }
    StatusBar#status{
        message-timeout:3000
    }
}
 
 
