DetailBar#details
{
    expanded:false
    
    {
        subset:attributes
        text:"${attributes}"
        icon-size:16
        icon:"icons/16/attributes.svg"
        layout:{
            type:VBoxLayout
            margin:8
        }
        GridLayout
        {
            column:6
            
            "${catalog}:" LineView{name:catalog}
            "${size}:" LineView{name:file_size,format:bytes}
            "${downloaded}:" LineView{name:downloaded,format:bytes}
            "${etag}:" LineView{name:etag}
            "${connectivity}:" LineView{name:connectivity}
            "${connect_timeout}:" LineView{name:connect_timeout,format:"number ms"}
            "${connections}:" LineView{name:connections}
            "${max_connections}:" LineView{name:max_connections}
            "${max_retry}:" LineView{name:max_retry}
            "${max_redirect}:" LineView{name:max_redirect}
            "${speed_limit_download}:" LineView{name:speed_limit_download,format:"number KB/s"}
            "${resumable}:" LineView{name:resumable}
            "${auto_rename_file}:" LineView{name:auto_rename_file}
            "${ignore_remote_modified}:" LineView{name:ignore_remote_modified}
            "${ignore_server_busy}:" LineView{name:ignore_server_busy}
            "${ignore_http_error}:" LineView{name:ignore_http_error}
            "${last_modified_time}: " LineView{name:last_modified,format:datetime}
            "${time_create}:" LineView{name:time_create,format:datetime}
            "${time_start}:" LineView{name:time_start,format:datetime}
            "${time_end}:" LineView{name:time_end,format:datetime}
        }
    
    }
    /*
    {
        subset:information
        text:"${info}"
        icon-size:16
        icon:"icons/16/info.svg"
        layout:{
            type:VBoxLayout
            margin:2
        }
        
        Edit{
            name:torrent_comment
            readonly:true
        }
    }
    */ 
    {
        subset:request
        text:"${request}"
        icon-size:16
        icon:"icons/16/request.svg"
        layout:VBoxLayout
        
        HBoxLayout
        {
            "${proxy}:" LineView{name:proxy}
            "${method}:" LineView{name:method}
            "Content-Type:" LineView{name:content_type}
        }
        GridLayout
        {
            column:2
     
            "${address}:" HBoxLayout{
                LineEdit#http_uri{
                    name:uri
                    readonly:true
                }
                ToolButton
                {
                    icon:"icons/16/copy.svg"
                    click:{
                        $copy(${#http_uri})
                    }
                }
            }
            
            "${page_url}:" HBoxLayout
            {
                LineEdit#page_url{
                    name:page_url
                    readonly:true
                }
                ToolButton{
                    icon:"icons/16/web.svg"
                    click:$open-url(${#page_url})
                }
            }
            "User Agent:" LineEdit{
                name:user_agent
                readonly:true
            }
            "Cookies:" TextEdit{
                name:cookies
                readonly:true
            }
            "Headers:" TextEdit{
                name:headers
                readonly:true
            }
        }
   
    }
    {
        subset:connections
        text:"${connections}"
        icon-size:16
        icon:"icons/16/connect.svg"
        layout:{
            type:VBoxLayout
            margin:1
        }
        Table.table#connections
        {
            sortable:true
            stripe:true
            editable:false
            grid:false
            numbers:true
            selection:rows
            min-height:100
            columns:{
                {name:"transferred",width:180,text:"${transferred}",format:bytes}
                {name:"begin",width:120,text:"${begin}",format:bytes}
                {name:"end",width:120,text:"${end}",format:bytes}
                {name:"state",width:180,text:"${state}"}
            }
        }
    }
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
    {
        subset:mirrors
        text:"${mirrors}"
        icon-size:16
        icon:"icons/16/circle.svg"
        layout:{
            type:VBoxLayout
            margin:2
        }
        
        TextEdit{
            name:mirrors
        }
    }
} 
