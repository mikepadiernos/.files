Action#act_add
{
    button-style:TextBesideIcon
    icon:"icons/24/add.svg"
    text:"${add}"
    trigger:$show{#dialog_add}()
}

Action#act_remove
{
    button-style:TextBesideIcon
    icon:"icons/16/delete.svg"
    text:"${remove}"
    trigger: $remove-selected-rows{#torrents}()
}

Action#act_clear
{
    icon:"icons/16/delete_all.svg"
    text:"${clear}"
    trigger: $clear-rows{#torrents}()
}
        

Dialog#dialog_add
{
    layout:VBoxLayout
    title:"${add}"
    width:600
    height:300
    
    TextEdit#uri
    {
        name:uri
        placeholder:"${magnet_links_placeholder}"
    }
    HBoxLayout
    {
        "${save_path}" PathEdit{
            value: $fs-temp-dir()
            name:save_path
            mode:dir
        }
    }
    HBoxLayout
    {
        <==>
       
        Button{
            text:"${add}"
            click:{
                $filec-submit("magnet_to_torrent",${#dialog_add},{
                    query_from_DHT:$value{#query_from_DHT}()
                })
                $value{#uri}("")
                $close{#dialog_add}()
            }
        }
        Button{
            text:"${cancel}"
            click:$close{#dialog_add}()
        }
    }
}

Dialog#main
{
    title:"${magnet_to_torrent}"
    width:800
    height:400
    layout:VBoxLayout
    
    HBoxLayout
    {
        ToolBar
        {
            icon-size:16
            button-style:TextBesideIcon
            
            ${#act_add}
            ${#act_remove}
            ${#act_clear}
        }
        <==>
        CheckBox#query_from_DHT{
            value:true
            enable:false
            text:"${query_from_DHT}(${slow},${reliable})"
        }
    }
    Table#torrents
    {
        name:torrents
        sortable:true
        stripe:true
        editable:true
        wordwrap:false
        selection:rows
        icon-size:24
        columns-height:26
        columns:{
            {name:hash,text:"HASH",width:280}
            {name:torrent_name,text:"${torrent_name}",width:180}
            {name:state,text:"${state}",160}
            {name:save_path,text:"${save_path}",width:320}
        }
    }
    
    HBoxLayout
    {
        "${state}:" Label{
            name:state
            text:"${none}"
        }
        "${unfinished}:" Label{
            name:unfinished
            text:"0"
        }
        <==>
    }
}


$filec-interval(magnet2torrent,{
    $filec-send("magnet_to_torrent_status")
})
$filec-on({
    magnet_to_torrent_status: $filec-form{#main}(...)
    magnet_to_torrent: $append{#torrents}(...)
})
