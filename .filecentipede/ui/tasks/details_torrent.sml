
///------------------------------
.table
{
    stretch-last-section:true
    sortable:true
    stripe:true
    editable:false
    numbers:false
    grid:false
    selection:rows
    min-height:100
}


///------------------------------
Menu#menu_tracker
{
    min-width:120
    
    Action#act_add_tracker{
        text:"${add}"
        icon:"icons/24/add.svg"
        trigger:{
            $clear{#dialog_add_tracker TextEdit}()
            $exec{#dialog_add_tracker}()
        }
    }
    Action#act_edit_tracker{
        text:"${edit}"
        icon:"icons/16/edit.svg"
    }
    Action#act_remove_tracker{
        text:"${remove}"
        icon:"icons/16/delete.svg"
    }
    Action#act_copy_tracker{
        text:"${copy} URL"
        icon:"icons/16/copy.svg"
    }
    ---
    Action#act_force_reannounce{
        text:"${selected} => ${force_reannounce}"
        icon:"icons/16/refresh.svg"
    }
    Action#act_force_reannounce_all{
        text:"${all} => ${force_reannounce}"
        icon:"icons/16/refresh.svg"
    }
}

Menu#menu_peers
{
    min-width:120
    
    Action#act_add_peer{
        text:"${add}"
        icon:"icons/16/add_user.svg"
        trigger:{
            $clear{#dialog_add_peer TextEdit}()
            $exec{#dialog_add_peer}()
        }
    }
    Action#act_disconnect_peer{
        text:"${disconnect}"
        icon:"icons/16/disconnect.svg"
    }
    Action#act_ban_peer{
        text:"${ban_ip}"
        icon:"icons/16/ban.svg"
    }
    Action#act_refresh_peers{
        text:"${refresh}"
        icon:"icons/16/refresh.svg"
    }
    ---
    Action#act_copy_peer_endpoint{
        text:"${copy} IP:${port}"
        icon:"icons/16/copy.svg"
    }
    Action#act_copy_peer_client{
        text:"${copy} ${client}"
        icon:"icons/16/copy.svg"
    }
}

Menu#menu_web_seeds
{
    min-width:120
    
    Action#act_add_web_seed{
        text:"${add}"
        icon:"icons/24/add.svg"
        trigger:{
            $clear{#add_tracker_url TextEdit}()
            $exec{#dialog_add_web_seed}()
        }
    }
    Action#act_edit_web_seed{
        text:"${edit}"
        icon:"icons/16/edit.svg"
    }
    Action#act_remove_web_seed{
        text:"${remove}"
        icon:"icons/16/delete.svg"
    }
    Action#act_copy_web_seed{
        text:"${copy} URL"
        icon:"icons/16/copy.svg"
    }
}



///------------------------------
InputDialog#dialog_edit_url
{
    width:500
    height:200
    mode:text
    title:"${edit}"
    label:"URL:"
}

Dialog#dialog_add_tracker
{
    title:"${add_tracker}"
    layout:VBoxLayout
    width:600
    height:300
    
    TextEdit{
        name:url
        placeholder:"${add_tracker_placeholder_}"
    }
    HBoxLayout{
        <==>
        Button#add_tracker{
            text:"${add}"
        }
        Button{
            text:"${cancel}"
            click:$close{#dialog_add_tracker}()
        }
    }
}

Dialog#dialog_add_peer
{
    title:"${add_peer}"
    layout:VBoxLayout
    
    TextEdit{
        name:endpoints
        placeholder:"${add_peer_placeholder_}"
    }
    HBoxLayout{
        <==>
        Button#add_peer{
            text:"${add}"
        }
        Button{
            text:"${cancel}"
            click:$close{#dialog_add_peer}()
        }
    }
}

Dialog#dialog_add_web_seed
{
    title:"${add_web_seed}"
    layout:VBoxLayout
    width:600
    height:300
    
    TextEdit{
        name:url
        placeholder:"${add_web_seed_placeholder_}"
    }
    HBoxLayout{
        <==>
        
        Button#add_web_seed{
            text:"${add}"
        }
        Button{
            text:"${cancel}"
            click:$close{#dialog_add_web_seed}()
        }
    }
}


///------------------------------
DetailBar#details
{
    title:"${torrent_task_details}"
    expanded:false
    
    {
        subset:attributes
        text:"${attributes}"
        icon-size:16
        icon:"icons/16/attributes.svg"
        layout:{
            type:VBoxLayout
            margin:10
        }
        
        GridLayout
        {
            column:6
      
            "${catalog}:" LineView{name:catalog}
            "${size}:" LineView{name:file_size,format:bytes}
            "${downloaded}:" LineView{name:downloaded,format:bytes}
            "${uploaded}:" LineView{name:uploaded,format:bytes}
            "${peers}:" LineView{name:peers}
            "${seeds}:" LineView{name:seeds}
            "${ratio}:" LineView{name:ratio}
            "${connections}:" LineView{name:connections}
            "${max_connections}:" LineView{name:max_connections}
            "${speed_limit_download}:" LineView{name:speed_limit_download,format:"number KB/s"}
            "${speed_limit_upload}:" LineView{name:speed_limit_upload,format:"number KB/s"}
            "${proxy}:" LineView{name:proxy}
            
            "${time_create}:" LineView{name:time_create,format:datetime}
            "${time_start}:" LineView{name:time_start,format:datetime}
            "${time_end}:" LineView{name:time_end,format:datetime}
        }
       
    }
    {
        subset:information
        text:"${info}"
        icon-size:16
        icon:"icons/16/info.svg"
        layout:{
            type:VBoxLayout
            margin:10
        }
        Edit{
            name:torrent_comment
            readonly:true
        }
        HBoxLayout
        {
            "${page_url}:"
            
            LineView#page_url{
                name:page_url
                readonly:true
            }
            ToolButton{
                icon:"icons/24/web.svg"
                click:$open-url(${#page_url})
            }
        }
        GridLayout
        {
            column:4
   
            "${creator}:" LineView{name:torrent_creator}
            "${creation_date}:" LineView{name:torrent_creation_date,format:datetime}
            "${name}:" LineView{name:torrent_name}
            "HASH:" LineView{name:hash}
            
           
        }
    }
    {
        subset:trackers
        text:"${tracker}"
        icon-size:16
        icon:"icons/16/tracker.svg"
        layout:{
            type:VBoxLayout
            margin:2
        }

        Table.table#tracker_list
        {
            sortable:false
            numbers:false
            context-menu:${#menu_tracker}
            columns:{
                {name:"tier",width:60,text:"${tier}",sort:asc}
                {name:"url",width:260,text:"URL"}
                {name:"status",width:100,text:"${status}"}
                {name:"peers",width:70,text:"${peers}"}
                {name:"seeds",width:70,text:"${seeds}"}
                {name:"downloads",width:80,text:"${downloads}"}
                {name:"leeches",width:70,text:"${leeches}"}
                {name:"next_announce",width:125,text:"${next_announce}",format:datetime}
                {name:"message",width:200,text:"${message}"}
            }
        }
    }
    {
        subset:web_seeds
        text:"${web_seeds}"
        icon-size:16
        icon:"icons/16/web.svg"
        layout:{
            type:VBoxLayout
            margin:2
        }
        Table.table#web_seeds_list
        {
            context-menu:${#menu_web_seeds}
            columns:{
                {name:"url",width:260,text:"URL"}
            }
        }
        
    }
    /*
    {
        subset:blocks
        text:"${blocks}"
        icon-size:16
        icon:"icons/16/partials.svg"
        layout:{
            type:VBoxLayout
            margin:1
        }
        Blocks{
            min-height:120
            name:blocks
        }
    }
    */
    {
        subset:peers
        text:"${peers}"
        icon-size:16
        icon:"icons/16/users.svg"
        layout:{
            type:VBoxLayout
            margin:2
        }
        Table.table#peer_list
        {
            context-menu:${#menu_peers}
            columns:{
                {name:location,width:60,text:"${location}"}
                {name:address,width:160,text:"${address}"}
                {name:conn_type,width:100,text:"${connection}"}
                {name:seed,width:60,text:"${seed}"}
                {name:progress,width:80,text:"${progress}",sort:desc}
                {name:download_speed,width:120,text:"${download_speed}",format:"bytes/s"}
                {name:upload_speed,width:100,text:"${upload_speed}",format:"bytes/s"}
                {name:downloaded,width:100,text:"${downloaded}",format:"bytes"}
                {name:uploaded,width:100,text:"${uploaded}",format:"bytes"}
                {name:client,width:120,text:"${client}"}
            }
        }
    }
} 
 
