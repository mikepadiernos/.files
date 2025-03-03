Action#act_add
{
    button-style: TextBesideIcon
    icon: "icons/24/add.svg"
    text: "${add}"
    trigger: $filec-send("torrent_to_magnet",{
        no_trackers:$value{#no_trackers}()
        no_web_seeds:$value{#no_web_seeds}()
        path:$get{#select_files}()
    })
}

Action#act_remove
{
    button-style: TextBesideIcon
    icon: "icons/16/delete.svg"
    text: "${remove}"
    trigger: $remove-selected-rows{#magnets}()
}

Action#act_clear
{
    icon: "icons/16/delete_all.svg"
    text: "${clear}"
    trigger: $clear-rows{#magnets}()
}

FileDialog#select_files
{
    mode:files
    filter:"*.torrent"
}


Dialog#main
{
    title:"${torrent_to_magnet}"
    width:800
    height:400
    layout:VBoxLayout
    droppable:true
    
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
        CheckBox#no_trackers
        {
            value:false
            text:"${no_trackers}"
        }
        CheckBox#no_web_seeds
        {
            value:false
            text:"${no_web_seeds}"
        }
    }
    Table#magnets
    {
        sortable:true
        stripe:true
        editable:true
        wordwrap:false
        selection:rows
        stretch-last-section:true
        icon-size:24
        columns-height:26
        columns:{
            {align:left,name:torrent_name,text:"${torrent_name}",width:140}
            {align:left,name:path,text:"${path}",width:180}
            {align:left,name:state,text:"${state}",width:100}
            {align:left,name:uri,text:"URI",width:512}
        }
    }
}
 
$filec-on("torrent_to_magnet",$append{#magnets}(...))
